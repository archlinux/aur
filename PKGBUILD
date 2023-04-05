# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=piping-server-git
pkgver=0.16.0.r20.g71a054d
pkgrel=1
pkgdesc="Infinitely transfer between any device over pure HTTP"
arch=('i686' 'x86_64')
url="https://github.com/nwtgck/piping-server-rust"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("piping-server=$pkgver")
conflicts=('piping-server')
source=("git+https://github.com/nwtgck/piping-server-rust.git")
sha256sums=('SKIP')


prepare() {
  cd "piping-server-rust"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "piping-server-rust"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "piping-server-rust"

  #cargo test \
  #  --frozen
}

package() {
  cd "piping-server-rust"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/piping-server"
}
