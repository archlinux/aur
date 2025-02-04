# Maintainer: robertxy <prfiredragon at gmail dot com>

pkgname='omada-controller-rxy'
pkgver=5.15.8.2
pkgrel=2
pkgdesc='Omada SDN Controller'
_basepkgname='Omada_SDN_Controller'
_basepkgpath='upload/software/2025/202501/20250109'
_baseos='linux_x64'
arch=('x86_64' 'aarch64')
url='https://www.tp-link.com/us/support/download/omada-software-controller/#Controller_Software'
license=('GPL')
depends=('java-runtime=11' 'java-jsvc' 'curl' 'mongodb>=3' 'mongodb<7')
makedepends=('git')
conflicts=('omada-sdn-controller' 'omada-controller')
install=omada-controller.install
source=(
    "https://static.tp-link.com/${_basepkgpath}/${_basepkgname}_v${pkgver}_${_baseos}.tar.gz"
    "git+https://github.com/prfiredragon/omada-controller-scripts.git"
)
sha256sums=('d1bcf9bd57484f28a29f040a895dc83f257f8a049011b5954f16b39192078039'
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

    # Install sysusers configuration.
    install -dm 755 "${pkgdir}/usr/lib/sysusers.d"
    install -m 644 "omada-controller.conf" "${pkgdir}/usr/lib/sysusers.d/"

    # Install ALPM hook and script.
    install -dm 755 "${pkgdir}/usr/share/libalpm/hooks"
    install -m 644 omada-init-user-dirs.hook "${pkgdir}/usr/share/libalpm/hooks/"
    install -dm 755 "${pkgdir}/usr/share/libalpm/scripts"
    install -m 755 omada-init-user-dirs.sh "${pkgdir}/usr/share/libalpm/scripts/omada-init-user-dirs"
}
