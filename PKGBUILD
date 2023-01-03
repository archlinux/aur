# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hoard-git
pkgver=1.3.0.r5.gbe38a20
pkgrel=1
pkgdesc="A CLI command organizer written in Rust (git)"
arch=('x86_64')
url="https://github.com/Hyde46/hoard"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
install="${pkgname%-git}.install"
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "src/shell/${pkgname%-git}.bash" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 "src/shell/${pkgname%-git}.zsh" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 "src/shell/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
