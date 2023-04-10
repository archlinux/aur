# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=agate-git
pkgver=3.3.0.r4.g4020791
pkgrel=3
pkgdesc="Very simple server for the Gemini hypertext protocol"
arch=('i686' 'x86_64')
url="https://github.com/mbrubeck/agate"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("agate=$pkgver")
conflicts=('agate')
options=('staticlibs')
source=("git+https://github.com/mbrubeck/agate.git")
sha256sums=('SKIP')


prepare() {
  cd "agate"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "agate"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "agate"

  #cargo test \
  #  --frozen
}

package() {
  cd "agate"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/agate"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/agate"
}
