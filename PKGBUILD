# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=openfx-io
pkgver=2.1.2
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/MrKepzie/openfx-io/tree/Natron-$pkgver"
license=("GPL2")
depends=("seexpr1" "openimageio" "ffmpeg") 
#depends=("opencolorio" "openexr" "openimageio" "ffmpeg" "boost-libs")
makedepends=("git" "expat" "boost")
source=("$pkgname::git://github.com/MrKepzie/openfx-io.git#tag=Natron-$pkgver" "GCC6.patch")
md5sums=("SKIP" "8da02f30c37861eaaac9245ff4cb005b")
_bits=32 ; [[ "$CARCH" = 'x86_64' ]] && _bits=64

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update -i --recursive
    cd "openfx"
    #note : patch is only useful for 2.1.2 & lower. should be fixed in next release
    patch -uNp1 -i $srcdir/GCC6.patch
}

build() {
    cd "$srcdir/$pkgname"
    make CONFIG=release BITS=$_bits
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/OFX/Plugins"
    make install PLUGINPATH=$pkgdir/usr/OFX/Plugins CONFIG=release BITS=$_bits
}
