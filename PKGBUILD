# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=de
pkgname=ting-${_lang}
pkgver=9.3.6
pkgrel=3
_llang=German
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
depends=('electron7')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('f09674efa9f29c4f8c3cee6f1a43b3037809e53f93f11cb5ff37abb853f1812908d98118480902e1e2a103babf1199050975185e1058ba90b4090ed101831625')

# sometime use curl to download source deb, throws 404 not found. 
# user other UA instead of origion one fixed it.
# https://wiki.archlinux.org/index.php/Nonfree_applications_package_guidelines#Custom_DLAGENT
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
    cd $srcdir
    mkdir -p build
    tar -xvf data.tar.xz  -C build/
    cd build
    dir_name=$(ls opt/)
    mv opt/${dir_name}/resources/app.asar ${pkgname}.asar 
}

package() {
    cd $srcdir/build
    
    mv usr/ ${pkgdir}/usr
    mkdir -p ${pkgdir}/usr/share/eusoft/${pkgname}
    mv  ${pkgname}.asar ${pkgdir}/usr/share/eusoft/${pkgname}/${pkgname}.asar
    sed -i "3c Exec=${pkgname} %U" ${pkgdir}/usr/share/applications/ting_${_lang}.desktop
    
    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
electron7 /usr/share/eusoft/${pkgname}/${pkgname}.asar
"""> ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
