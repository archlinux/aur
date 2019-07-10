# Maintainer: Alan Hardman <alan@phpizza.com>

pkgname=mapcrafter-world113-git
pkgver=v.2.3.1.r0.g2e33e0d
pkgrel=1
pkgdesc="A High Performance Minecraft Map Renderer - Experimental MC 1.13 branch"
arch=("i686" "x86_64")
license=("GPL")
url="http://mapcrafter.org"
makedepends=("cmake" "boost" "imagemagick")
depends=("boost-libs" "libpng" "libjpeg" "curl" "python2")
optdepends=(
    "python2-pillow: support for mapcrafter_png-it.py script"
)
provides=("mapcrafter")
conflicts=("mapcrafter")
source=("$pkgname"::"git://github.com/mapcrafter/mapcrafter.git#branch=world113")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g' 
}

build() {
    cd "$srcdir/$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
    make
}

package() {
    cd "$srcdir/$pkgname"
    VERBOSE=1 make install

    curl --output /tmp/mc.jar https://s3.amazonaws.com/Minecraft.Download/versions/$(cat MCVERSION)/$(cat MCVERSION).jar
    python2 "$srcdir/$pkgname/src/tools/mapcrafter_textures.py" -f /tmp/mc.jar "$pkgdir/usr/share/mapcrafter/textures"
}
