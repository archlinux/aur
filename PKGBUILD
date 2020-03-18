# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=libgpg-error
pkgname=$_target-$_pkgname
pkgver=1.37
pkgrel=1
pkgdesc='Support library for libgcrypt (ARM64)'
arch=(x86_64)
url='https://www.gnupg.org'
license=(LGPL)
depends=($_target-glibc)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  ftp://ftp.gnupg.org/gcrypt/libgpg-error/$_pkgname-$pkgver.tar.bz2{,.sig}
)
sha256sums=(
  'b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763'
  'SKIP'
)
validpgpkeys=(
  'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6' # Werner Koch
  '031EC2536E580D8EA286A9F22071B08A33BD3F06' # NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

prepare() {
  cd $_srcdir

  autoreconf -vfi
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="${pkgdir}/" install
  popd
}
