# Maintainer: robertfoster
pkgname=codanna
pkgver=0.6.7 # renovate: datasource=github-tags depName=bartolli/codanna
pkgrel=1
pkgdesc="X-ray vision for your agent - Code assistant with understanding of functions, relationships, and implementations"
arch=('x86_64')
url="https://github.com/bartolli/codanna"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'cargo' 'pkg-config')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('068271b2bfcfa3bff12f4b27ba8d4f61af47cce35e42b8d53a7f6d7bd4872941')

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
