# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=es
pkgname=ting-${_lang}
pkgver=9.7.4
pkgrel=1
_llang=Spanish
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
_electron=electron11
depends=("${_electron}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('820baec73bc6df379b544f52a40cfe6870fd9013248ddc766426ab441e44fe5834cb1451ff1d658a52240e3a22cfa3059b2946981d5f105b5140e67147f816a8')

# sometime use curl to download source deb, throws 404 not found.
# user other UA instead of origion one fixed it.
# https://wiki.archlinux.org/index.php/Nonfree_applications_package_guidelines#Custom_DLAGENT
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
    cd $srcdir
    mkdir -p build
    tar -xvf data.tar.xz -C build/
    cd build
    dir_name=$(ls opt/)
    mv opt/${dir_name}/resources/app.asar ${pkgname}.asar
}

package() {
    cd $srcdir/build

    mv usr/ ${pkgdir}/usr
    mkdir -p ${pkgdir}/usr/share/eusoft/${pkgname}
    mv ${pkgname}.asar ${pkgdir}/usr/share/eusoft/${pkgname}/${pkgname}.asar
    sed -i "s|^Exec.*|Exec=${pkgname} %U|" ${pkgdir}/usr/share/applications/ting_${_lang}.desktop

    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
exec ${_electron} /usr/share/eusoft/${pkgname}/${pkgname}.asar --disable-gpu-sandbox "\$@"
""" >${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
