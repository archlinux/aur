# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
# Contributor: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='omada-sdn-controller'
pkgver=4.4.4
pkgrel=2
pkgdesc='Centralized Omada SDN controller software'
arch=('x86_64')
url='https://www.tp-link.com/us/support/download/omada-software-controller/#Controller_Software'
license=('custom')
depends=('jre8-openjdk' 'java-jsvc' 'curl' 'mongodb>=3.0' 'mongodb<4')
provides=('sdn-controller')
conflicts=('eap-controller')
source=(
    "http://static.tp-link.com/upload/software/2021/202108/20210813/Omada_SDN_Controller_v4.4.4_linux_x64.tar.gz"
    "git://github.com/tlonic/omada-sdn-controller-scripts.git#commit=8123f2aad2cda365c5a19d7e386d2de6e79402d9" 
)
sha256sums=('b1b8d77cead05c545540fbc6934ca6df8c1b26a8b8be7641dc21c0907c454d97'
            'SKIP')


package() {
    # Install required source files.
    cd "${srcdir}/Omada_SDN_Controller_v${pkgver}_linux_x64"
    local BASEDIR="${pkgdir}/opt/omada-sdn-controller"
    install -dm 755 "${BASEDIR}"

    # Install JAR libraries.
    install -dm 755 "${BASEDIR}/lib"

    for file in lib/*; do
        install -m 644 "${file}" "${BASEDIR}/lib/"
    done

    # Install binaries.
    install -dm 755 "${BASEDIR}/bin"

    for file in bin/*; do
        install -m 755 "${file}" "${BASEDIR}/bin/"
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

    ln -sf /usr/bin/mongod "${BASEDIR}/bin/mongod"

    ### Install scripts ####

    # Install systemd units.
    cd "${srcdir}/omada-sdn-controller-scripts"
    install -dm 755 "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "omada-sdn-controller.service" "${pkgdir}/usr/lib/systemd/system/"

    # Install sysusers configuration.
    install -dm 755 "${pkgdir}/usr/lib/sysusers.d"
    install -m 644 "omada-sdn-controller.conf" "${pkgdir}/usr/lib/sysusers.d/"

    # Install ALPM hook and script.
    install -dm 755 "${pkgdir}/usr/share/libalpm/hooks"
    install -m 644 omada-init-user-dirs.hook "${pkgdir}/usr/share/libalpm/hooks/"
    install -dm 755 "${pkgdir}/usr/share/libalpm/scripts"
    install -m 755 omada-init-user-dirs.sh "${pkgdir}/usr/share/libalpm/scripts/omada-init-user-dirs"
}
