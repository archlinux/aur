# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=fr
pkgname=ting-${_lang}
pkgver=9.7.4
pkgrel=1
_llang=French
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
_electron=electron11
depends=("${_electron}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('cf3dc37ddaeaf9e07068b4462bd6305e9d6a0039b4a8853bef096e48e27727a032c3876e9ef6173f97931eca6cb80471e0656793b4bc92054a604a5f3e48aae6')

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
