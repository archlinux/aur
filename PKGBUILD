# Maintainer: hoream <hoream@qq.com>

_pkgname=yuvviewer
pkgname="${_pkgname}-git"
pkgver=0.5.3.r15.g4d26058
pkgrel=1
pkgdesc="A small tool for developers to view and preview various original image formats."
arch=("x86_64")
url="https://github.com/QQxiaoming/TTFviewer"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=("opencv" "qt6-base" "qt6-svg" "xdg-utils" "glibc" "gcc-libs")
makedepends=("git" "qt6-tools" "qt5-tools")
options=()
source=("${_pkgname}::git+https://github.com/QQxiaoming/YUVviewer.git")
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
    YUVVIEWER_MAJARVERSION="0"
    YUVVIEWER_SUBVERSION="5"
    YUVVIEWER_REVISION="3"
    PATH=$QT_DIR/bin
    LD_LIBRARY_PATH=$QT_DIR/lib
    QT_PLUGIN_PATH=$QT_DIR/plugins
    QML2_IMPORT_PATH=$QT_DIR/qml
    TTFVIEWER_VERSION=$TTFVIEWER_MAJARVERSION$TTFVIEWER_SUBVERSION$TTFVIEWER_REVISION
    CFLAGS+=" -fPIE"
    LDFLAGS+=" -pie"

    sed -i 's/^OPENCV_DIR=.*/OPENCV_DIR=\/usr/' partform_unix.pri
    sed -i 's/rgbImglist.insert(rgbImglist.constEnd(), rgbImg)/rgbImglist.append(rgbImg)/g' src/YUVdecoder.cpp

    # extra-x86_64 will fail without this.
    sed -i '/^PRE_TARGETDEPS/d' ./YUVviewer.pro
    sed -i '/^QMAKE_EXTRA_TARGETS/d' ./YUVviewer.pro
    sed -i "s/#include <git_tag.inc>/\"${pkgver}\"/" ./src/YUVviewer.cpp

    lrelease ./YUVviewer.pro
    qmake6 ./YUVviewer.pro -spec linux-g++ CONFIG+=qtquickcompiler
    make
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${_pkgname}/build_release/out/YUVviewer" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/dpkg/YUVviewer/usr/share/applications/YUVviewer.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/img/ico.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    sed -i "s/^Exec=.*/Exec=\/usr\/bin\/${_pkgname}/" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/^Icon=.*/Icon=${_pkgname}/" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
