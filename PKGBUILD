# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uthenticode-git
pkgver=1.0.9.r5.g6a3c5a0
pkgrel=1
pkgdesc="A cross-platform library for verifying Authenticode signatures"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/uthenticode/"
license=('MIT')
depends=('gcc-libs' 'openssl' 'pe-parse')
makedepends=('git' 'cmake')
provides=("uthenticode=$pkgver")
conflicts=('uthenticode')
options=('staticlibs')
source=("git+https://github.com/trailofbits/uthenticode.git")
sha256sums=('SKIP')


pkgver() {
  cd "uthenticode"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "uthenticode"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "uthenticode"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uthenticode"
}
