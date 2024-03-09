# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rebels-in-the-sky-git
pkgver=1.0.6.r0.gaf90efd
pkgrel=1
pkgdesc="P2P terminal game about spacepirates playing basketball across the galaxy (git)"
url="https://github.com/ricott1/rebels-in-the-sky"
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

# check() {
#   cd "${pkgname%-git}"
#   cargo test --frozen
# }

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/rebels" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
