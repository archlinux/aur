# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=poketex-git
pkgver=1.1.0.r0.g523a2bd
pkgrel=1
pkgdesc="Simple Pokedex based on TUI (git)"
arch=('x86_64')
url="https://github.com/ckaznable/poketex"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$pkgname-$pkgver-cargo-lock.patch::$url/commit/161129b77f64a927b50ce40983cc2f092ac57fa5.patch")
sha512sums=('SKIP'
            '4527c6038fc839af9255198dbffc37c76c0ab05e448f7e6520958743d987c5663aae0479d43dd6bce78d48bc5d6735ae3bf3bb2a1dd8b7075b754842f5b648fd')

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
