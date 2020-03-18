# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=libxslt
pkgname=$_target-$_pkgname
pkgver=1.1.34
pkgrel=1
pkgdesc='XML stylesheet transformation library (ARM64)'
arch=(x86_64)
url='http://xmlsoft.org/XSLT/'
license=(custom)
depends=($_target-libxml2 $_target-libgcrypt)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz
)
sha256sums=(
  'c61af4c898a93c2862f3f06bba8e5de5e352463febc94a2642d732f21e5d5641'
)

_srcdir=$_pkgname-v$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

prepare() {
  cd $_srcdir

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure \
    --without-python
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd
}
