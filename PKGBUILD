# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=fr
pkgname=ting-${_lang}
pkgver=9.6.0_105
pkgrel=1
_llang=French
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
_electron=electron11
depends=("${_electron}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('7482f7d136d7e769082fb4fcf1fb9c802d2302d69a5941a5892d48f8a318b9b9cf84bb6ea71ba016f4959dc163f0f8addf84eaf5aa48e83ef6abe34ed4a91709')

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
    sed -i "s|^Exec.*|Exec=${pkgname} %U|" ${pkgdir}/usr/share/applications/ting_${_lang}.desktop

    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
${_electron} /usr/share/eusoft/${pkgname}/${pkgname}.asar --disable-gpu-sandbox "\$@"
"""> ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
