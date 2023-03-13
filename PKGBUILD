# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=codevis-git
pkgver=0.7.0.r0.g481b335
pkgrel=1
pkgdesc="A tool for turning your code into one large image (git)"
arch=('x86_64')
url="https://github.com/sloganking/codevis"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$pkgname-$pkgver-cargo-lock.patch::$url/commit/1040b13aa03836678ec4ac5660994708ca559518.patch")
sha512sums=('SKIP'
            '75ead7523ae0731f008b24eeec051adf48f48f97ad674be4d8eabc2e7f3eeb540bf45520f9a8c076fcc53b71e63d6b4a841c32b0b6451d1931da12a4c093fd73')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "../$pkgname-$pkgver-cargo-lock.patch"
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
