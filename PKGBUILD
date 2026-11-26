# Maintainer: robertfoster
pkgname=rayfish
pkgver=0.5.19 # renovate: datasource=github-releases depName=rayfish/rayfish
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/rayfish/rayfish"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f3ee9bc33cddda4a6f817fa5bb1a91e33dd36f700af47d997a8d6a60f49feaa2')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/ray \
    "${pkgdir}/usr/bin/ray"
  install -Dm644 contrib/rayfish.service \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  sed -i 's|/usr/local/bin/ray|/usr/bin/ray|' \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
