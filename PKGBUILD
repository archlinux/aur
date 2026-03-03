# Maintainer: taotieren <admin@taotieren.com>

pkgname=svgtopng-git
pkgver=1.0.r1.g8d66691
pkgrel=1
pkgdesc="SVG to PNG Converter"
arch=($CARCH)
url="https://github.com/tonglingcn/svgtopng"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    libgcc
    libstdc++
    hicolor-icon-theme
    qt6-base
    qt6-svg
)
makedepends=(
    git 
    cmake
    qt6-tools
    ninja
    vulkan-headers
)
optdepends=()
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

    sed -i -e 's|/opt/apps/com.github.svgtopng/files/bin/||g' \
        -e 's|/opt/apps/com.github.svgtopng/entries/icons/||g' svgtopng.desktop

    sed -i -e 's|files/bin|bin|g' \
        -e 's|entries/applications|share/applications|g' \
        -e 's|entries/icons|share/icons/hicolor/scalable/apps|g' \
        -e '/^# Install generated info file/,/^    DESTINATION \.)/d' CMakeLists.txt

    cmake -B build \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -G Ninja \
          -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -vDm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
