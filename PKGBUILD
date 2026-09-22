# Maintainer: robertxy <prfiredragon at gmail dot com>

pkgname='omada-controller-rxy'
pkgver=6.3.0.45
pkgrel=1
pkgdesc='Omada SDN Controller'
_basepkgname='Omada_Network_Application'
_basepkgpath='upload/software/2026/202609/20260904'
_baseos='linux_x64'
_last_code='20260903171900'
arch=('x86_64' 'aarch64')
url='https://www.tp-link.com/us/support/download/omada-software-controller/#Controller_Software'
license=('GPL')
depends=('java-runtime=17' 'java-jsvc' 'curl' 'mongodb>=3' 'mongodb<7')
makedepends=('git')
conflicts=('omada-sdn-controller' 'omada-controller')
install=omada-controller.install
source=(
    "https://static.tp-link.com/${_basepkgpath}/${_basepkgname}_v${pkgver}_${_baseos}_${_last_code}.tar.gz"
    "git+https://github.com/prfiredragon/omada-controller-scripts.git"
)
sha256sums=('dadf7e187fa2b21892a3f26475ae15360f41d64f578a70f0801d2ae19da9eb6a'
            'SKIP')

package() {
    cd ${_basepkgname}_v${pkgver}_${_baseos} 

    # Install required source files.
    local BASEDIR="${pkgdir}/opt/omada-controller"
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

    # Install *.properties config files.
    install -dm 755 "${BASEDIR}/properties"

    for file in properties/*; do
        install -m 644 "${file}" "${BASEDIR}/properties/"
    done

    ln -sf /usr/bin/mongod "${BASEDIR}/bin/mongod"

    ### Install scripts ####

    # Install systemd units.
    cd "${srcdir}/omada-controller-scripts"
    install -dm 755 "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "omada-controller.service" "${pkgdir}/usr/lib/systemd/system/"
    #systemctl daemon-reload #Not alowed any more

    # Install sysusers configuration.
    install -dm 755 "${pkgdir}/usr/lib/sysusers.d"
    install -m 644 "omada-controller.conf" "${pkgdir}/usr/lib/sysusers.d/"

    # Install ALPM hook and script.
    install -dm 755 "${pkgdir}/usr/share/libalpm/hooks"
    install -m 644 omada-init-user-dirs.hook "${pkgdir}/usr/share/libalpm/hooks/"
    install -dm 755 "${pkgdir}/usr/share/libalpm/scripts"
    install -m 755 omada-init-user-dirs.sh "${pkgdir}/usr/share/libalpm/scripts/omada-init-user-dirs"
}
