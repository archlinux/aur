# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="gr-framework-git"
pkgver="0.71.7.r15.gdb48fb11"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://gr-framework.org"
license=("MIT")
depends=("bzip2" "cairo" "fontconfig" "freetype2" "ghostscript" "glfw-x11" \
         "libjpeg-turbo" "libpng" "libtiff" "libx11" "libxft" "libxt" "pixman" \
         "qhull" "qt5-base" "zlib")
makedepends=("git" "cmake")
optdepends=("ffmpeg: video support")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/sciapp/gr.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-*}" || return
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-*}" || return
    cmake -DCMAKE_INSTALL_PREFIX=/usr/gr \
          -DCMAKE_BUILD_TYPE=Release \
          -DGR_USE_BUNDLED_LIBRARIES=OFF \
          -S . \
          -B build && \
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname%-*}" || return
    DESTDIR="${pkgdir}" cmake --install build
}
