# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=glib2
pkgname=$_target-$_pkgname
pkgver=2.64.1
pkgrel=1
pkgdesc='Low level core library (ARM64)'
arch=(x86_64)
url='https://wiki.gnome.org/Projects/GLib'
license=(LGPL2.1)
depends=($_target-pcre $_target-libffi $_target-libutil-linux $_target-zlib)
makedepends=($_target-util-linux $_target-meson)
options=(!buildflags)
source=(
  https://gitlab.gnome.org/GNOME/glib/-/archive/$pkgver/glib-$pkgver.tar.gz
)
sha256sums=(
  '562c7f04b39cda4d6349b06ab62377f33c6cb9055dff36cd51c04d1291ec654c'
)

_srcdir=glib-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"

  $_target-meson \
    -D selinux=disabled \
    -D man=true \
    ..

  ninja
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  DESTDIR="$pkgdir" ninja install
  popd
}
