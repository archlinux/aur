# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec-git
pkgver=0.6.2.r0.g39e7560
pkgrel=1
pkgdesc="Blazingly fast terminal recorder (git)"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('imagemagick')
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
  cd "${pkgname%-git}-rs"
  cargo fetch --locked
}

build() {
  cd "${pkgname%-git}-rs"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}-rs"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}-rs"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
