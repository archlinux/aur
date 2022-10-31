# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=en
pkgname=ting-${_lang}
pkgver=9.6.0_105
pkgrel=1
_llang=English
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
_electron=electron11
depends=("${_electron}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('5a4b34103a603925ad434b70a093e1c50512820d37db9e53ad29985f174d3a0f988e8aeaa8dbfd104ba26d69ae7311a625ad8f63a1ad2b4544699a06452f831e')

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
