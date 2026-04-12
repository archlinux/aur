# Maintainer: Gauthier Jolly <contact@gjolly.fr>
pkgname=nitrotpm-tools
pkgver=1.1.0
pkgrel=1
pkgdesc='A collection of utilities for working with NitroTPM attestation'
arch=('x86_64')
url='https://github.com/aws/NitroTPM-Tools'
license=('Apache-2.0')
depends=('tpm2-tss')
makedepends=('cargo' 'pkgconf' 'cmake' 'nasm')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aws/NitroTPM-Tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d410c4c8772c3d3ac60b4dd632135a8d45f0e8fdbfd1b255694e12313f53697b')

prepare() {
  cd "NitroTPM-Tools-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "NitroTPM-Tools-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bins
}

package() {
  cd "NitroTPM-Tools-${pkgver}"
  install -Dm755 target/release/nitro-tpm-attest "${pkgdir}/usr/bin/nitro-tpm-attest"
  install -Dm755 target/release/nitro-tpm-pcr-compute "${pkgdir}/usr/bin/nitro-tpm-pcr-compute"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
