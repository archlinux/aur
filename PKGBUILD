# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=pcre
pkgname=$_target-$_pkgname
pkgver=8.44
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions (ARM64)'
arch=(x86_64)
url='https://www.pcre.org/'
license=(BSD)
depends=($_target-readline $_target-zlib $_target-bzip2)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://ftp.pcre.org/pub/pcre/$_pkgname-$pkgver.tar.bz2{,.sig}
)
sha256sums=(
  '19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d'
  'SKIP'
)
validpgpkeys=(
  '45F68D54BBE23FB3039B46E59766E084FB0F43D8' # Philip Hazel
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure \
    --enable-unicode-properties \
    --enable-pcre16 \
    --enable-pcre32 \
    --enable-jit \
    --enable-pcregrep-libz \
    --enable-pcregrep-libbz2 \
    --enable-pcretest-libreadline

  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd
}
