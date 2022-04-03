# Maintainer: Duncan Russell <duncan at anomalocaris dot xyz>

pkgname=handlr-regex
pkgver=0.7.1
pkgrel=1
pkgdesc="Fork of handlr with regex support"
arch=('x86_64')
url="https://github.com/Anomalocaridid/handlr-regex"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=(handlr)
conflicts=(handlr)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('888cf8d2371ad80a24f93c6d27e299054d3778d8aba0c81f9b82cfb49915d8a5654539ee518104e9a9f44bac23e40fe34758aa5d76d5c7fdb5d9fa2492df11d5')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/handlr" -t "${pkgdir}/usr/bin"
  install -Dm 755 "completions/handlr" -t "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 755 "completions/handlr.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm 755 "completions/_handlr" -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
