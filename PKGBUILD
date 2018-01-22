# Maintainer: Moritz Hilscher <m0r13@mapcrafter.org>

pkgname=mapcrafter
pkgver=2.4
pkgrel=1
pkgdesc="A High Performance Minecraft Map Renderer"
arch=("i686" "x86_64")
license=("GPL")
url="http://mapcrafter.org"
makedepends=("cmake" "boost" "imagemagick")
depends=("boost-libs" "libpng" "libjpeg" "curl" "python2")
conflicts=("mapcrafter-git")
provides=("mapcrafter")
optdepends=(
    "python2-pillow: support for mapcrafter_png-it.py script"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapcrafter/mapcrafter/archive/v.${pkgver}.tar.gz")

sha256sums=('f3b698d34c02c2da0c4d2b7f4e251bcba058d0d1e4479c0418eeba264d1c8dae')

build() {
    cd "${srcdir}/${pkgname}-v.${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
    make
}

package() {
    cd "${srcdir}/${pkgname}-v.${pkgver}"
    VERBOSE=1 make install

    curl --output /tmp/mc.jar https://s3.amazonaws.com/Minecraft.Download/versions/$(cat MCVERSION)/$(cat MCVERSION).jar
    python2 "${srcdir}/${pkgname}-v.${pkgver}/src/tools/mapcrafter_textures.py" -f /tmp/mc.jar "${pkgdir}/usr/share/mapcrafter/textures"
}
