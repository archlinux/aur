# Maintainer: Sosthène Guédon <sosthene@guedon.gdn>
pkgname=openpgp-card-tools
pkgver=0.9.0
pkgrel=1
pkgdesc="tool for inspecting, configuring and using OpenPGP cards"
arch=('any')
url="" 
license=('Apache' 'MIT')
makedepends=(
  'cargo'
  'nettle'
)
provides=(
  'opgpcard'
)

depends=(
  'pcsclite'
)
source=("https://gitlab.com/openpgp-card/openpgp-card/-/archive/tools/v${pkgver}/openpgp-card-tools-v${pkgver}.tar.gz")
sha256sums=('62033a23a70065b2d9fba3b55dc0c55c385c0e266a319c1659b21d4ff619f7eb')

prepare() {
  cd ${pkgname}-v${pkgver}
  cargo fetch --target "$CARCH-unknown-linux-gnu" #--locked
}

build() {
  cd ${pkgname}-v${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin opgpcard
}

check() {
  cd ${pkgname}-v${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-v${pkgver}
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/opgpcard"
}
