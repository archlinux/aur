# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=libgcrypt
pkgname=$_target-$_pkgname
pkgver=1.8.5
pkgrel=1
pkgdesc='General purpose cryptographic library based on the code from GnuPG (ARM64)'
arch=(x86_64)
url='https://www.gnupg.org'
license=(LGPL)
depends=($_target-libgpg-error)
makedepends=($_target-environment)
options=(!buildflags)
source=(
  https://gnupg.org/ftp/gcrypt/$_pkgname/$_pkgname-$pkgver.tar.bz2{,.sig}
)
sha256sums=(
  '3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3'
  'SKIP'
)
validpgpkeys=(
  '031EC2536E580D8EA286A9F22071B08A33BD3F06' # "NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>"
  'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6' # Werner Koch
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
  make DESTDIR="$pkgdir" install
  popd
}
