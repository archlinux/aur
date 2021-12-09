# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano-git
pkgver=0.5.0.r0.g9f0ee2b
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding. (git)"
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
depends=('bzip2')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}-rs"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}-rs/${pkgname%-git}-cli"
  cargo fetch --locked
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
