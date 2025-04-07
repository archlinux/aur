# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notepad--
_pkgname=NotePad--
pkgver=3.2
pkgrel=1
pkgdesc="A text editor written in C++,to eventually surpass Notepad++.一个国产跨平台,轻量级的文本编辑,是替换notepad++的一种选择.其内置强大的代码对比功,让你丢掉付费的beyond compare."
arch=('x86_64')
url="https://gitee.com/cxasm/notepad--"
_ghurl="https://github.com/cxasm/notepad--"
license=('GPL-3.0-or-later')
provides=("${pkgname}")
depends=(
    'glibc'
    'gcc-libs'
    'qt5-base'
)
makedepends=(
    'git'
    'ninja'
    'qt5-tools'
    'qt5-xmlpatterns'
    'qscintilla-qt5'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=notepad-v${pkgver}"
)
sha256sums=('0b5924b5ed8706cb9523e2d84ece0989427c0177d309c17b9db6dda1b58d0881')
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/intptr_t/__intptr_t/g" src/qscint/src/xmlMatchedTagsHighlighter.cpp
    sed -i "s/intptr_t/__intptr_t/g" src/qscint/src/xmlMatchedTagsHighlighter.h
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -Bbuild -GNinja -DCMAKE_BUILD_TYPE=None -W no-dev
    ninja -C build
    sed -i -e "
        s/${_pkgname} %F/${pkgname} %F/g
        s/\/usr\/share\/icons\/hicolor\/128x128\/apps\/${pkgname}.png/${pkgname}/g
    " src/linux/usr/share/applications/"${_pkgname}".desktop
    sed -i "s/io.gitee.cxasm.${pkgname}/${pkgname}/g" src/linux/usr/share/metainfo/io.gitee.cxasm."${pkgname}".metainfo.xml
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/linux/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    _icon_sizes=(32x32 64x64 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/linux/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/linux/usr/share/metainfo/io.gitee.cxasm.${pkgname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
}