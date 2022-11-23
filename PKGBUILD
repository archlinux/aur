# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libck-git
pkgver=0.7.1.r14.g6e8e5be
pkgrel=1
pkgdesc="Concurrency primitives, safe memory reclamation mechanisms and non-blocking (including lock-free) data structures"
arch=('i686' 'x86_64')
url="http://concurrencykit.org/"
license=('apache' 'BSD' 'custom')
depends=('glibc')
makedepends=('git')
provides=("libck=$pkgver")
conflicts=('libck')
options=('staticlibs')
source=("git+https://github.com/concurrencykit/ck.git")
sha256sums=('SKIP')


pkgver() {
  cd "ck"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ck"

  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "ck"

  #make check
}

package() {
  cd "ck"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libck"
}
