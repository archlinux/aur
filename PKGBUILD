# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libaio-git
pkgver=0.3.113.r1.gb8eadc9
pkgrel=1
pkgdesc="The Linux-native asynchronous I/O facility (aio) library"
arch=('i686' 'x86_64')
url="https://codeberg.org/jmoyer/libaio"
license=('LGPL-2.1-or-later')
depends=('glibc')
makedepends=('git')
provides=("libaio=$pkgver" 'libaio.so')
conflicts=('libaio')
options=('staticlibs' '!lto')
source=("git+https://codeberg.org/jmoyer/libaio.git")
sha256sums=('SKIP')


pkgver() {
  cd "libaio"

  _tag=$(git tag -l --sort -creatordate | grep -E '^libaio-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libaio-//'
}

build() {
  cd "libaio"

  make
}

check() {
  cd "libaio"

  #make partcheck
}

package() {
  cd "libaio"

  make DESTDIR="$pkgdir" install
  install -Dm644 {ChangeLog,README.md} -t "$pkgdir/usr/share/doc/libaio"
  install -Dm644 man/*.3 -t "$pkgdir/usr/share/man/man3"
}
