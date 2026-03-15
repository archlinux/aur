# Maintainer: robertfoster
pkgname=codanna
pkgver=0.9.17 # renovate: datasource=github-tags depName=bartolli/codanna
pkgrel=1
pkgdesc="X-ray vision for your agent - Code assistant with understanding of functions, relationships, and implementations"
arch=('x86_64')
url="https://github.com/bartolli/codanna"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'cargo' 'pkg-config')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d0f6965cd1168320bc595127def22c1973c04e8b7a5f5b85b0458197fcaef447')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" \
    "target/release/$pkgname"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
