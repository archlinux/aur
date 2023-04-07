# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=enet-git
pkgver=1.3.17.r29.gea4607a
pkgrel=1
pkgdesc="A thin, simple and robust network communication layer on top of UDP"
arch=('i686' 'x86_64')
url="http://enet.bespin.org/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("enet=$pkgver")
conflicts=('enet')
options=('staticlibs')
source=("git+https://github.com/lsalzman/enet.git")
sha256sums=('SKIP')


pkgver() {
  cd "enet"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "enet"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "enet"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/enet"
}
