# shellcheck shell=bash
pkgname=gitu
pkgver=0.5.4
pkgrel=1
pkgdesc="A TUI Git client inspired by Magit"
arch=('x86_64')
url="https://github.com/altsem/gitu"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')
options=('!lto')

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
