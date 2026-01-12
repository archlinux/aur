# Maintainer: taotieren <admin@taotieren.com>

pkgname=file-manager-preview-git
pkgver=r5.a226f12
pkgrel=1
pkgdesc="Modern file manager with preview support"
arch=($CARCH)
url="https://github.com/tonglingcn/file-manager"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    gcc-libs
    hicolor-icon-theme
    qt6-base
    qt6-multimedia
    qt6-webengine
)
makedepends=(
    git 
    cmake
    qt6-tools
    ninja
)
optdepends=(
    "gst-plugins-good: Multimedia graph framework - good plugins"
    "gst-plugins-bad: Multimedia graph framework - bad plugins"
    "gst-libav: Multimedia graph framework - libav plugin"
    "libreoffice-still: LibreOffice maintenance branch"
    "unoconv: Libreoffice-based document converter"
)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}/"
    sed -i '1s/^#include "OfficeConverter.h"/#include "OfficeConverter.h"\n#include <QRegularExpression>/' src/OfficeConverter.cpp

    cmake -B build \
          -DCMAKE_BUILD_TYPE=Release \
          -DENABLE_QT_PDF=ON \
          -DENABLE_QT_WEBENGINE=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -G Ninja \
          -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -vDm644 ""${srcdir}"/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
