# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="gr-framework"
pkgver="0.50.0"
pkgrel="2"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://gr-framework.org"
license=("MIT")
depends=("bzip2" "cairo" "fontconfig" "freetype2" "ghostscript" "glfw-x11" \
         "libjpeg-turbo" "libpng" "libtiff" "libx11" "libxft" "libxt" "pixman" \
         "qhull" "qt5-base" "zlib")
makedepends=("cmake")
optdepends=("ffmpeg: video support")
source=("https://github.com/sciapp/gr/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.patch")
sha256sums=("59947975c364b8ce98940eee4cf98a665ede66083362e60f3e3520d9c7d8bc1e"
            "d0a1153447977bca8a0336396b7b5dcfa3f04d65570a88f5a507af19f9ff1b98")

prepare() {
    cd "${srcdir}/gr-${pkgver}" || return
    patch -Np1 -i "${srcdir}/${pkgname}-${pkgver}.patch" && \
    echo "${pkgver}" > version.txt
}

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    cmake -DCMAKE_INSTALL_PREFIX=/usr/gr \
          -DCMAKE_BUILD_TYPE=Release \
          -DGR_USE_BUNDLED_LIBRARIES=OFF \
          -S . \
          -B build && \
    cmake --build build
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    DESTDIR="${pkgdir}" cmake --install build
}
