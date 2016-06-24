# Do not delete this file.
# It is used by many scripts to read configuration file.

read_config() {

    if [ -e "${CONFIG_FILE}" ]; then
        echo "Reading configuration file: ${CONFIG_FILE}"
        source "${CONFIG_FILE}"
    fi

    if [ -z "${ORIGIN_HOME}" ]; then
        echo "Error parsing configuration file: ${CONFIG_FILE}"
        echo "Sample configuration:
        ORIGIN_HOME=/var/lib/origin
        PUBLIC_HOSTNAME=$(hostname)
        ROUTING_SUFFIX=apps.$(hostname)
        ADMIN_USERNAME=$(whoami)
        CERT_FILE=/path-to/$(hostname)/certificate
        KEY_FILE=/path-to/$(hostname)/private-key
        "

        exit 1
    fi
}