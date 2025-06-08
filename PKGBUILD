# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hexpatch-git
_pkgname=HexPatch
pkgver=1.12.0.r25.gcc36625
pkgrel=1
pkgdesc="A binary patcher and editor with a TUI"
arch=('x86_64')
url="https://github.com/Etto48/HexPatch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'cmake' 'python')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/hex-patch" -t "${pkgdir}/usr/bin"
  install -Dm 644 docs/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
