# Maintainer: hoream <hoream@qq.com>

_pkgname=ttfviewer
pkgname="${_pkgname}-git"
pkgver=0.2.8.r27.g7dc4441
pkgrel=1
pkgdesc="A small tool for developers to view and preview various ttf font/icon image formats."
arch=("x86_64")
url="https://github.com/QQxiaoming/TTFviewer"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=("gcc-libs" "glibc" "xdg-utils" "freetype2" "qt6-base" "qt6-svg")
makedepends=("git" "qt6-tools" "qt5-tools")
options=()
source=("${_pkgname}::git+https://github.com/QQxiaoming/TTFviewer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^V//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/${_pkgname}"
    QT_DIR=/usr
    TTFVIEWER_MAJARVERSION="0"
    TTFVIEWER_SUBVERSION="2"
    TTFVIEWER_REVISION="4"
    PATH=$QT_DIR/bin
    LD_LIBRARY_PATH=$QT_DIR/lib
    QT_PLUGIN_PATH=/usr/lib/qt6/plugins
    QML2_IMPORT_PATH=/usr/lib/qt6/qml
    TTFVIEWER_VERSION=$TTFVIEWER_MAJARVERSION$TTFVIEWER_SUBVERSION$TTFVIEWER_REVISION
    QMAKE="/usr/bin/qmake6"

    CFLAGS+=" -fPIE"
    LDFLAGS+=" -pie"

    sed -i 's/^FREETPE2_DIR=.*/FREETPE2_DIR=\/usr/' partform_unix.pri
    # disable git_tag.inc to ignore missing target problem.
    sed -i '/^PRE_TARGETDEPS/d' ./TTFviewer.pro
    sed -i '/^QMAKE_EXTRA_TARGETS/d' ./TTFviewer.pro
    # sed -i "s/#include <git_tag.inc>/\"${pkgver}\"/" ./src/TTFviewer.cpp

    # type casting
    sed -i 's/tags = ftoutline.tags;/tags = reinterpret_cast<char*>(ftoutline.tags);/g' src/font_to_svg.hpp
    sed -i 's/contours = ftoutline.contours;/contours = reinterpret_cast<short int*>(ftoutline.contours);/g' src/font_to_svg.hpp

    ./tools/generate_info.sh > build_info.inc

    lrelease ./TTFviewer.pro
    qmake6 ./TTFviewer.pro -spec linux-g++ CONFIG+=qtquickcompiler
    make
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${_pkgname}/build_release/out/TTFviewer" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/dpkg/TTFviewer/usr/share/applications/TTFviewer.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/img/ico.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    sed -i "s/^Exec=.*/Exec=\/usr\/bin\/${_pkgname}/" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/^Icon=.*/Icon=${_pkgname}/" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
