# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="gr-framework"
pkgver="0.56.0"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://gr-framework.org"
license=("MIT")
depends=("bzip2" "cairo" "fontconfig" "freetype2" "ghostscript" "glfw-x11" \
         "libjpeg-turbo" "libpng" "libtiff" "libx11" "libxft" "libxt" "pixman" \
         "qhull" "qt5-base" "zlib")
makedepends=("cmake" "emscripten")
optdepends=("ffmpeg: video support")
source=("https://github.com/sciapp/gr/archive/v${pkgver}.tar.gz")
sha256sums=("9e297d23d5adfca28b206ab03c7c938ac461616159120bd021d966c62e97f862")

prepare() {
    cd "${srcdir}/gr-${pkgver}" || return
    echo "${pkgver}" > version.txt
}

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    cmake -DCMAKE_INSTALL_PREFIX=/usr/gr \
          -DCMAKE_BUILD_TYPE=Release \
          -DGR_USE_BUNDLED_LIBRARIES=OFF \
          -S . \
          -B build && \
    cmake --build build && \
    /usr/lib/emscripten/emmake make -C js
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    DESTDIR="${pkgdir}" cmake --install build && \
    cp "js/gr.js" "${pkgdir}/usr/gr/lib/"
}
