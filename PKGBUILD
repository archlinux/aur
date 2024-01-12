# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libiscsi-git
pkgver=1.19.0.r261.g0fac8df
pkgrel=1
pkgdesc="A client-side library to implement the iSCSI protocol"
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libiscsi"
license=('custom' 'LGPL')
depends=('glibc' 'libgcrypt')
makedepends=('git')
provides=("libiscsi=$pkgver")
conflicts=('libiscsi')
options=('staticlibs')
source=("git+https://github.com/sahlberg/libiscsi.git")
sha256sums=('SKIP')


pkgver() {
  cd "libiscsi"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libiscsi"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libiscsi"

  make check
}

package() {
  cd "libiscsi"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libiscsi"
}
