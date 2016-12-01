# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-io
pkgver=2.1.9
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/MrKepzie/openfx-io/tree/Natron-$pkgver"
license=("GPL2")
depends=("seexpr1" "openimageio" "ffmpeg") 
#depends=("opencolorio" "openexr" "openimageio" "ffmpeg" "boost-libs")
makedepends=("git" "expat" "boost")
source=("$pkgname::git+https://github.com/MrKepzie/openfx-io.git#tag=Natron-$pkgver"
        'git+https://github.com/devernay/openfx.git'
        'git+https://github.com/MrKepzie/SequenceParsing'
        'git+https://github.com/devernay/openfx-supportext.git'
        'git+https://github.com/MrKepzie/tinydir')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
_bits=32 ; [[ "$CARCH" = 'x86_64' ]] && _bits=64

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.openfx.url $srcdir/openfx
  git config submodule.IOSupport/SequenceParsing.url $srcdir/SequenceParsing
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update

  cd IOSupport/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
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
