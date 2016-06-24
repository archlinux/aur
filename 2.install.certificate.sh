#!/bin/bash

CONFIG_FILE="$1"


# Install your server's certificate and private key into cluster.

# You need to run this script as root or have sudo access without password.

# Certificate and private key will be copied from existing location into cluster.
# master-config.yaml will be updated with information about the certificate.

# You can specify the existing location of certificate and private key with CERT_FILE and KEY_FILE keys in config.sh .
# Or you will be asked to specify this info interactively by this script.

_read_certificate_from_user() {

    DEFAULT_CERT_FILE="/etc/letsencrypt/live/${PUBLIC_HOSTNAME}/cert.pem"
     DEFAULT_KEY_FILE="/etc/letsencrypt/live/${PUBLIC_HOSTNAME}/privkey.pem"

    echo "Enter path to certificate file i.e. ${DEFAULT_CERT_FILE}"
    read -p "Certificate file : " CERT_FILE

    echo "Enter path to private key file i.e. ${DEFAULT_KEY_FILE}"
    read -p "Private key file : " KEY_FILE

}

_write_config() {

    echo "Writing config to ${CONFIG_FILE}..."
    echo "CERT_FILE=${CERT_FILE}" >> "${CONFIG_FILE}"
    echo  "KEY_FILE=${KEY_FILE}"  >> "${CONFIG_FILE}"

}

installCertificate=true

_validate_certificate() {

    validCert=false
    validKey=false

    [ -e "${CERT_FILE}" ] && validCert=true

    [ -e "${KEY_FILE}" ] && validKey=true

    if [ $validCert = false ]
    then
        echo "Error: Missing certificate: ${CERT_FILE}"
        installCertificate=false
    fi

    if [ $validKey = false ]
    then
        echo "Error: Missing private key: ${KEY_FILE}"
        installCertificate=false
    fi

}

_install_certificate() {

    sudo cp "${CERT_FILE}" "${ORIGIN_HOME}/openshift.local.config/master/certFile.pem"
    sudo cp "${KEY_FILE}"  "${ORIGIN_HOME}/openshift.local.config/master/keyFile.pem"

    configFileMaster="${ORIGIN_HOME}/openshift.local.config/master/master-config.yaml"

    sudo cp "${configFileMaster}" "${configFileMaster}.original"

    search='  namedCertificates: null'
    replace="  namedCertificates:|  - certFile: certFile.pem|    keyFile: keyFile.pem|    names:|    - \"DomainName\""

    sudo sed -i "/^${search}/c =${replace}"         "${configFileMaster}"
    sudo sed -i "s/=//"                             "${configFileMaster}"
    sudo sed -i "s/|/\n/g"                          "${configFileMaster}"
    sudo sed -i "s/DomainName/${PUBLIC_HOSTNAME}/g" "${configFileMaster}"

}


main() {

    if [ -z "${CONFIG_FILE}" ]; then
        echo "You have to pass configuration file."
        echo "Usage:     install.certificate.sh <path-to-config-file>"
        echo "Example: ./install.certificate.sh ./config.sh"
    fi

    source "0.read.config.sh"
    read_config

    if [ -z "${CERT_FILE}" ]; then
        _read_certificate_from_user
    fi

    _validate_certificate

    if [ "${installCertificate}" = true ]
    then
        echo "Installing certificate..."
        _install_certificate
        _write_config
        echo "Certificate has been installed."
    else
        echo "ERROR: Certificate installation failed."
        echo "Make sure to enter path to existing certificate and private key."
    fi

    docker restart origin

}

main
