# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano-git
pkgver=0.5.1.r7.g8b34dba
pkgrel=1
pkgdesc="A CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding. (git)"
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}-rs"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}-rs/${pkgname%-git}-cli"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}-rs/${pkgname%-git}-cli"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}-rs/${pkgname%-git}-cli"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}-rs"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
