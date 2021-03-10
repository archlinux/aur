# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=fr
pkgname=ting-${_lang}
pkgver=9.3.2
pkgrel=1
_llang=French
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
depends=('electron7')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('6d731368f0a454c3e017290cbb57367d7918c5d6c4a13b3b247a92d743130189612d08359d93d6deeb3099b2f25f785677564086356c4c493f34679ff733c338')

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
    mkdir -p ${pkgdir}/usr/share/eusoft-${pkgname}
    mv  ${pkgname}.asar ${pkgdir}/usr/share/eusoft-${pkgname}/${pkgname}.asar
    sed -i "3c Exec=${pkgname} %U" ${pkgdir}/usr/share/applications/ting_${_lang}.desktop
    
    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
electron7 /usr/share/eusoft-${pkgname}/${pkgname}.asar
"""> ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
