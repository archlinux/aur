# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnet-git
pkgver=1.2.r158.gd8a0019
pkgrel=1
pkgdesc="A portable framework for low-level network packet construction"
arch=('i686' 'x86_64')
url="https://github.com/libnet/libnet"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=("libnet=$pkgver")
conflicts=('libnet')
options=('staticlibs')
source=("git+https://github.com/libnet/libnet.git")
sha256sums=('SKIP')


pkgver() {
  cd "libnet"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libnet"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "libnet"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libnet"
}
