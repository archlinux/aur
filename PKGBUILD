# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notepad--
_pkgname=NotePad--
pkgver=2.16
pkgrel=1
pkgdesc="一个国产跨平台、轻量级的文本编辑器，是替换notepad++的一种选择。其内置强大的代码对比功能，让你丢掉付费的beyond compare。"
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
    'gcc'
    'cmake'
    'ninja'
    'base-devel'
    'qt5-tools'
    'qt5-xmlpatterns'
    'qscintilla-qt5'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgname//--/}-v${pkgver}.tar.gz"
)
sha256sums=('80f979d60948805adcb45224bb71f7ef7c3837eb3b899be5a9eaa8aae710e88b')
build() {
    cd "${srcdir}/${pkgname}-${pkgname//--/}-v${pkgver}"
    sed "s|intptr_t|__intptr_t|g" -i src/qscint/src/xmlMatchedTagsHighlighter.cpp
    sed "s|intptr_t|__intptr_t|g" -i src/qscint/src/xmlMatchedTagsHighlighter.h
    cmake -S . -Bbuild -GNinja -DCMAKE_BUILD_TYPE=None -W no-dev
    ninja -C build
    sed "s|${_pkgname} %F|${pkgname} %F|g;s|/usr/share/icons/hicolor/128x128/apps/${pkgname}.png|${pkgname}|g" \
        -i src/linux/usr/share/applications/"${_pkgname}".desktop
    sed "s|io.gitee.cxasm.${pkgname}|${pkgname}|g" -i src/linux/usr/share/metainfo/io.gitee.cxasm."${pkgname}".metainfo.xml
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgname//--/}-v${pkgver}/build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgname//--/}-v${pkgver}/src/linux/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 32x32 64x64 128x128;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgname//--/}-v${pkgver}/src/linux/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgname//--/}-v${pkgver}/src/linux/usr/share/metainfo/io.gitee.cxasm.${pkgname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
}