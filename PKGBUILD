# Maintainer: Christopher Daley (crdaley <at> gmail <dot> com)
# Creator: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='omada-controller-v3'
pkgver=3.2.17
_scriptsver=1.1.3
pkgrel=1
pkgdesc='Centralized EAP controller software v3 from access points that do not support v5.'
arch=('x86_64')
url='https://www.tp-link.com/support/download/eap-controller/#Controller_Software'
license=('custom')
conflicts=('omada-controller')
depends=('jre8-openjdk' 'java-jsvc' 'net-tools')
provides=('eap-controller')
source=(
    "https://static.tp-link.com/upload/software/2022/202208/20220818/Omada_Controller_v3.2.17_Linux_x64.tar.gz"
    "${pkgname}-scripts-${_scriptsver}.tar.gz::https://github.com/conqp/omada-controller-scripts/archive/${_scriptsver}.tar.gz"
)
sha256sums=('3c1ef8beff9ce6b71b322c7a2f499f7d2c1551873fb6e9355fba8d59a40d7d0f'
            '8325c691e01617a49b5fd541f284e8f35cb19743b21082ea6845745949cac59b')


package() {
    # Install required source files.
    cd "${srcdir}/Omada_Controller_v${pkgver}_linux_x64"
    local BASEDIR="${pkgdir}/opt/omada-controller"
    install -dm 755 "${BASEDIR}"

    # Install custom mongodb binary.
    install -dm 755 "${BASEDIR}/bin"
    install -m 755 "bin/mongod" "${BASEDIR}/bin/"

    # Install JAR libraries.
    install -dm 755 "${BASEDIR}/lib"

    for file in lib/*; do
        install -m 644 "${file}" "${BASEDIR}/lib/"
    done

    # Install keystore.
    install -dm 755 "${BASEDIR}/keystore"

    for file in keystore/*; do
        install -m 644 "${file}" "${BASEDIR}/keystore/"
    done

    # Install *.properties config files.
    install -dm 755 "${BASEDIR}/properties"

    for file in properties/*; do
        install -m 644 "${file}" "${BASEDIR}/properties/"
    done

    # Install web applications.
    install -dm 755 "${BASEDIR}/webapps"

    for file in webapps/*; do
        install -m 644 "${file}" "${BASEDIR}/webapps/"
    done

    ### Install scripts ####

    # Install systemd units.
    cd "${srcdir}/omada-controller-scripts-${_scriptsver}"
    install -dm 755 "${pkgdir}/usr/lib/systemd/system"
    install -m 644 omada-controller.service "${pkgdir}/usr/lib/systemd/system/"

    # Install sysusers configuration.
    install -dm 755 "${pkgdir}/usr/lib/sysusers.d"
    install -m 644 "omada-controller.conf" "${pkgdir}/usr/lib/sysusers.d/"

    # Install ALPM hook and script.
    install -dm 755 "${pkgdir}/usr/share/libalpm/hooks"
    install -m 644 omada-init-user-dirs.hook "${pkgdir}/usr/share/libalpm/hooks/"
    install -dm 755 "${pkgdir}/usr/share/libalpm/scripts"
    install -m 755 omada-init-user-dirs.sh "${pkgdir}/usr/share/libalpm/scripts/omada-init-user-dirs"
}
