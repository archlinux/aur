# Maintainer: TF <mail | at | sedi [DOT] one>
pkgname=('kesl' 'kesl-gui')
pkgver=11.2.0.4528
_pkgver_gui=11.2.1.4528
_pkgverbuild=$(echo ${pkgver} | cut -d "." -f 4)
_pkgver=$(echo ${pkgver} | cut -d "." -f 1-3)
pkgrel=1
arch=('x86_64')
pkgdesc='Kaspersky Endpoint Security 11.2.0 for Linux'
url='https://www.kaspersky.de/small-to-medium-business-security/endpoint-linux'
license=('custom')
noextract=("kesl_${_pkgver}-${_pkgverbuild}_amd64.deb" "kesl-gui_${_pkgver}-${_pkgverbuild}_amd64.deb")
depends=('perl')
options=("!strip")
conflicts=( 'eea'
            'esets'
            'eea-dkms'
            'eea7-dkms')
install=${pkgname}.install
changelog=${pkgname}.changelog
# https://www.kaspersky.com/small-to-medium-business-security/downloads/endpoint?ignoreredirects=true
source=( "https://products.s.kaspersky-labs.com/endpoints/keslinux10/${pkgver}/multilanguage-${pkgver}/3437313131347c44454c7c31/kesl_${_pkgver}-${_pkgverbuild}_amd64.deb"
         "https://products.s.kaspersky-labs.com/endpoints/keslinux10/${pkgver}/multilanguage-${_pkgver_gui}/3437373638347c44454c7c4e554c4c/kesl-gui_${_pkgver}-${_pkgverbuild}_amd64.deb"
         "${pkgname}.install"
         "kesl.ini")
sha256sums=('44aef3025d9c440a87effa684169057d4a50d31dca9cc1e2e1d91a2cd42f6160'
            'dc2c5c82cac25ba6ebf02220deb5c40fd2035bd24e74a62fb6d0bf3933e7db31'
            'ee9df719cdba6ffb1928c6f8b3e32acf55de3d5a683128f0d9540676651f57a2'
            'ec1dd039f4048589acb8987f3c4e7c52f659ef21483d65daf0cdc94756483821')
validpgpkeys=('6AFE173577C4CBD621DF217FD093435AA3ED2C4A')

package_kesl() {
    # prepare dirs
    mkdir -p ${pkgdir}/usr/src
    mkdir -p ${pkgdir}/etc/init.d

    KESLIDIR=${pkgdir}/var/opt/kaspersky/kesl/install

    # uncompress base packages
    bsdtar -xf kesl_${_pkgver}-${_pkgverbuild}_amd64.deb
    bsdtar -xf data.tar.xz -C ${pkgdir}/

    # install deb post/pre scripts
    [ ! -d "${pkgdir}/var/opt/kaspersky/kesl/pkgscripts" ] && mkdir -p ${pkgdir}/var/opt/kaspersky/kesl/pkgscripts
    bsdtar -xf control.tar.gz -C ${pkgdir}/var/opt/kaspersky/kesl/pkgscripts
    cp kesl.ini ${pkgdir}/var/opt/kaspersky/kesl/pkgscripts/

    # /usr/local/share/man is owned by pkg filesystem
    mv ${KESLIDIR}/usr/local/share ${KESLIDIR}/usr/
    chmod 755 -R ${KESLIDIR}/usr/
    rm -rf ${KESLIDIR}/usr/local/ ${pkgdir}/usr/local

    # man pages
    [ ! -d ${KESLIDIR}/usr/local/share/man/man1 ] && mkdir -p ${KESLIDIR}/usr/local/share/man/man1
    for m in $(find ${KESLIDIR}/usr/share/man/man1 -maxdepth 1 -mindepth 1 -type f);do
        ln -s /usr/share/man/man1/${m/*\/} ${KESLIDIR}/usr/local/share/man/man1/${m/*\/}
    done
    [ ! -d ${KESLIDIR}/usr/local/share/man/man5 ] && mkdir -p ${KESLIDIR}/usr/local/share/man/man5
    for m in $(find ${KESLIDIR}/usr/share/man/man5 -maxdepth 1 -mindepth 1 -type f);do
        ln -s /usr/share/man/man5/${m/*\/} ${KESLIDIR}/usr/local/share/man/man5/${m/*\/}
    done

    # install licenses
    for lic in $(find ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/doc/ -maxdepth 1 -mindepth 1 -type f |grep license);do
        install -Dm644 ${lic} "$pkgdir/usr/share/licenses/$pkgname/${lic/*\/}"
    done
}

package_kesl-gui(){
    pkgdesc='Kaspersky Endpoint Security 11.2.0 for Linux (GUI)'
    depends=('kesl' 'freetype2' 'qt5-svg')
    install=${pkgname}.install

    KESLIDIR=${pkgdir}/var/opt/kaspersky/kesl/install

    bsdtar -xf kesl-gui_${_pkgver}-${_pkgverbuild}_amd64.deb
    bsdtar -xf data.tar.xz -C ${pkgdir}/

    [ ! -d "${pkgdir}/var/opt/kaspersky/kesl-gui/pkgscripts" ] && mkdir -p ${pkgdir}/var/opt/kaspersky/kesl-gui/pkgscripts
    bsdtar -xf control.tar.gz -C ${pkgdir}/var/opt/kaspersky/kesl-gui/pkgscripts

    chmod 711 ${pkgdir}/var/opt/kaspersky/kesl/install/opt/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/shared/loc/

    chmod 511 ${pkgdir}/var/opt/kaspersky/kesl/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/bin/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/lib64/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/libexec/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/shared/ \
        ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/shared/init/storage/

    chmod 500 ${pkgdir}/var/opt/kaspersky/kesl/install/opt/kaspersky/kesl/shared/init/
}


