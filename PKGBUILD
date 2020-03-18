# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=libxml2
pkgname=$_target-$_pkgname
pkgver=2.9.10
pkgrel=3
pkgdesc='XML parsing library, version 2 (ARM64)'
arch=(x86_64)
url='http://www.xmlsoft.org/'
license=(MIT)
depends=($_target-glibc $_target-icu $_target-xz $_target-zlib)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/v$pkgver/libxml2-v$pkgver.tar.gz
)
sha256sums=(
  'f07dab13bf42d2b8db80620cce7419b3b87827cc937c8bb20fe13b8571ee9501'
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
  make install DESTDIR="${pkgdir}"
  popd
}
