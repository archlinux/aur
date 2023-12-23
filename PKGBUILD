# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=asio-git
pkgver=1.29.0.r6.ged5db1b50
pkgrel=1
pkgdesc="A cross-platform C++ library for network and low-level I/O"
arch=('any')
url="https://think-async.com/Asio/"
license=('BSL-1.0')
depends=('glibc')
makedepends=('git')
provides=("asio=$pkgver")
conflicts=('asio')
source=("git+https://github.com/chriskohlhoff/asio.git")
sha256sums=('SKIP')


pkgver() {
  cd "asio"

  _tag=$(git tag -l --sort -v:refname | grep -E '^asio-[0-9\.-]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^asio-//;s/-/./g'
}

build() {
  cd "asio/asio"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "asio/asio"

  #make check
}

package() {
  cd "asio/asio"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/asio"
}
