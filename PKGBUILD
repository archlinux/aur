# Maintainer: Murtuza Akhtari <murtuza dot akhtari at gmail dot com>
# Contributor: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='omada-controller'
pkgver=5.12.7
pkgrel=1
pkgdesc='Omada SDN Controller'
_basepkgname='Omada_SDN_Controller'
_basepkgpath='upload/software/2023/202309/20230920'
_baseos='Linux_x64'
arch=('x86_64')
url='https://www.tp-link.com/us/support/download/omada-software-controller/#Controller_Software'
license=('custom')
depends=('java-runtime>=8' 'java-jsvc' 'curl' 'mongodb>=3' 'mongodb<5')
makedepends=('git' 'binutils')
#provides=('sdn-controller')
conflicts=('omada-sdn-controller')
source=(
    "https://static.tp-link.com/${_basepkgpath}/${_basepkgname}_v${pkgver}_${_baseos}.deb"
    "git+http://github.com/murtuzaakhtari/omada-controller-scripts.git"
)
noextract=("https://static.tp-link.com/${_basepkgpath}/${_basepkgname}_v${pkgver}_${_baseos}.deb")
sha256sums=('28a004ae360d68de463265b65b7335124fcf6be99f02e69047c2644f4c678aa0'
            'SKIP')

prepare(){
    ar x ${_basepkgname}_v${pkgver}_${_baseos}.deb
    rm -rf control.tar.xz debian-binary
    tar --xz -xvf data.tar.xz
    rm -rf data.tar.xz
}
package() {
    #cd ${_basepkgname}
    #cd ${_basepkgname}_v${pkgver}_${_baseos} # use when TP Link provides a .tar.gz package
    cd opt/tplink/EAPController #use when TP Link only provides a .deb package

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

    # Install keystore. - keystore no longer available since version 5.3.1
    #install -dm 755 "${BASEDIR}/keystore"

    #for file in keystore/*; do
    #    install -m 644 "${file}" "${BASEDIR}/keystore/"
    #done

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
