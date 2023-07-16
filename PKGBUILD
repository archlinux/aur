# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage-git
pkgver=1.2.1.r0.g6156416a6
pkgrel=1
pkgdesc="Display images in your terminal (git)"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
        #"$url/releases/download/v${pkgver%.r*}/${pkgname%-git}-man-v${pkgver%.r*}.tbz2")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  # TODO: Use `--locked` flag for reproducibility.
  # Tracking issue: https://github.com/nabijaczleweli/termimage/pull/16#issuecomment-729920052
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  #install -Dm 644 "../${pkgname%-git}-man-v${pkgver%.r*}/${pkgname%-git}.md" -t "$pkgdir/usr/share/doc/$pkgname"
  #install -Dm 644 "../${pkgname%-git}-man-v${pkgver%.r*}/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
