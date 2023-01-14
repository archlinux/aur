# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uthenticode-git
pkgver=1.0.9.r0.g3a91122
pkgrel=1
pkgdesc="A cross-platform library for verifying Authenticode signatures"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/uthenticode/"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cmake')
provides=("uthenticode=$pkgver")
conflicts=('uthenticode')
options=('staticlibs')
source=("git+https://github.com/trailofbits/uthenticode.git")
sha256sums=('SKIP')


pkgver() {
  cd "uthenticode"

  _tag=$(git tag -l --sort -v:refname | grep -P '^v?[\d\.]+$' | head -n1)
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
