# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=readlater-git
pkgver=r11.a83fb84
pkgrel=1
pkgdesc="Read web articles later via RSS/Epub"
arch=('x86_64')
url="https://github.com/jelly/readlater"
license=('MIT')
depends=(glibc openssl sqlite)
makedepends=(rust git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/jelly/readlater.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE 
}
