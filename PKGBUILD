# Maintainer: taotieren <admin@taotieren.com>

pkgname=notepad---git
pkgver=2.9.r0.g7e34bfd
pkgrel=1
pkgdesc="这是一个使用 C++ 编写的文本编辑器 Notepad--,可以支持 Win/Linux/Mac 平台。"
arch=('x86_64')
url="https://github.com/cxasm/notepad--"
license=('GPL3')
provides=(${pkgname%-git} notepadplugin)
conflicts=(${pkgname%-git})
_qt=qt5
depends=($_qt-base
        $_qt-xmlpatterns
        qscintilla-$_qt)
makedepends=(cmake
            ninja
            git
            $_qt-tools)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/^notepad-v//g;s/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/"

    sed -i 's/\bintptr_t\b/__intptr_t/g' src/qscint/src/xmlMatchedTagsHighlighter.cpp
    sed -i 's/\bintptr_t\b/__intptr_t/g' src/qscint/src/xmlMatchedTagsHighlighter.h
    sed -i '5503s/^/bool isClearSwpFile = false;\n/' src/cceditor/ccnotepad.cpp
    sed -i 's/NotePad--/notepad--/g' CMakeLists.txt

    cmake -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -W no-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
