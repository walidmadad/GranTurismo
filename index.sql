CREATE TABLE VILLE (
    Num_ville INT PRIMARY KEY,
    nom_ville VARCHAR(255),
    pays VARCHAR(255)
);

CREATE TABLE CLIENT (
    num_client INT PRIMARY KEY,
    nom_client VARCHAR(255),
    prenom_client VARCHAR(255),
    Ad_rue_client VARCHAR(255),
    CP_client VARCHAR(10),
    Ville_client VARCHAR(255),
    clientNumParrain INT
);

CREATE TABLE CAR (
    num_car INT PRIMARY KEY,
    marque VARCHAR(255),
    nombre_places INT,
    num_immatriculation VARCHAR(20)
);

CREATE TABLE ACCOMPAGNATEUR (
    num_accompagnateur INT PRIMARY KEY,
    nom_accompagnateur VARCHAR(255),
    prenom_accompagnateur VARCHAR(255)
);

CREATE TABLE ACTIVITE (
    num_activite INT PRIMARY KEY,
    Intitule_activite VARCHAR(255),
    Duree_activite INT,
    nb_places_max INT
);

CREATE TABLE VOYAGE (
    Num_voyage INT PRIMARY KEY,
    Intitule_voyage VARCHAR(255),
    Prix_voyage DECIMAL(10, 2),
    Date_debut DATE,
    Date_fin DATE,
    num_car INT,
    villeDep INT,
    villeArv INT
);

CREATE TABLE PARAMETRES (
    Taux_TVA DECIMAL(5, 2)
);

CREATE TABLE Encadrer (
    VoyNum INT,
    Acc_Num INT,
    PRIMARY KEY (VoyNum, Acc_Num)
);

CREATE TABLE Comporter (
    num_activite INT,
    VoyNum INT,
    PRIMARY KEY (num_activite, VoyNum)
);

CREATE TABLE Inscrire (
    VoyNum INT,
    num_client INT,
    Nb_participants INT,
    arrhes_verses DECIMAL(10, 2),
    inscription DATE,
    PRIMARY KEY (VoyNum, num_client)
);

CREATE TABLE arreter (
    VoyNum INT,
    Num_ville INT,
    Date_arret DATE,
    PRIMARY KEY (VoyNum, Num_ville)
);

ALTER TABLE CLIENT
ADD FOREIGN KEY (Ville_client) REFERENCES VILLE(Num_ville);

ALTER TABLE VOYAGE
ADD FOREIGN KEY (num_car) REFERENCES CAR(num_car)
ADD FOREIGN KEY (villeDep) REFERENCES VILLE(Num_ville)
ADD FOREIGN KEY (villeArv) REFERENCES VILLE(Num_ville);

ALTER TABLE Encadrer
ADD FOREIGN KEY (VoyNum) REFERENCES VOYAGE(Num_voyage)
ADD FOREIGN KEY (Acc_Num) REFERENCES ACCOMPAGNATEUR(num_accompagnateur);

ALTER TABLE Comporter
ADD FOREIGN KEY (num_activite) REFERENCES ACTIVITE(num_activite)
ADD FOREIGN KEY (VoyNum) REFERENCES VOYAGE(Num_voyage);

ALTER TABLE Inscrire
ADD FOREIGN KEY (VoyNum) REFERENCES VOYAGE(Num_voyage)
ADD FOREIGN KEY (num_client) REFERENCES CLIENT(num_client);

ALTER TABLE arreter
ADD FOREIGN KEY (VoyNum) REFERENCES VOYAGE(Num_voyage) 
ADD FOREIGN KEY (Num_ville) REFERENCES VILLE(Num_ville);


