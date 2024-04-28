# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=en
pkgname=ting-${_lang}
pkgver=9.7.4
pkgrel=1
_llang=English
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
_electron=electron11
depends=("${_electron}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('233940fe7c2f73f260c5d6a61478fea9b16d93f5cfd9518e0db7b25655c11bf30c0fc8d5567bb0c57d3c07770c20aa678f3538c169e318ab31d9e2e008fbc528')

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
