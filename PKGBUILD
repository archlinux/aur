# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fw-git
pkgver=2.19.1.r3.gd2d0c95
pkgrel=1
pkgdesc="Workspace productivity booster (git)"
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('custom:WTFPL')
depends=('fzf' 'zlib' 'openssl')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
}
