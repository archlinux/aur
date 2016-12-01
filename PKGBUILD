# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-arena
pkgver=2.1.9
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/olear/openfx-arena/tree/Natron-$pkgver"
license=("GPL2")
makedepends=("git")
depends=("gcc-libs-multilib" "imagemagick" "libcdr" "librsvg" "libtool" "libzip" "opencolorio" "poppler-glib")
source=("$pkgname::git://github.com/olear/openfx-arena.git#tag=Natron-$pkgver"
        "git+https://github.com/devernay/openfx.git"
        "git+https://github.com/devernay/openfx-supportext.git"
        "git+https://github.com/MrKepzie/openfx-io.git"
        "git+https://github.com/MrKepzie/SequenceParsing"
        "git+https://github.com/MrKepzie/tinydir")
md5sums=("SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP"
         "SKIP")

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.OpenFX.url $srcdir/openfx
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git config submodule.OpenFX-IO.url $srcdir/openfx-io
  git submodule update

  cd OpenFX-IO
  git config submodule.IOSupport/SequenceParsing.url $srcdir/SequenceParsing
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git config submodule.openfx.url $srcdir/openfx
  git submodule update

  cd IOSupport/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins CONFIG=release
}
