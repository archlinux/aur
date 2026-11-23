# Maintainer: agony <27015 at riseup dot net>

pkgname=all-smi
pkgver=0.29.1
pkgrel=1
pkgdesc='Command-line utility for monitoring GPU hardware'
arch=('x86_64' 'aarch64')
url='https://github.com/lablup/all-smi'
license=('Apache-2.0')
depends=('glibc' 'libdrm' 'libgcc')
makedepends=('cargo' 'protobuf')
options=('!lto')
backup=('etc/default/all-smi')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('37ddbd92f52ecfcc756de7fcf2d2f046c361c3caa5c1c67a77f797ee9f989996')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p all-smi -p all-smi-amd-plugin
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/all-smi --version)" == "all-smi ${pkgver}" ]]
  [[ "$(target/release/all-smi snapshot --format prometheus)" == *"version=\"${pkgver}\""* ]]
  [[ "$(ALL_SMI_ENERGY_CURRENCY=EUR target/release/all-smi config print | grep '^currency')" == 'currency = "EUR"' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/all-smi -t "${pkgdir}/usr/bin"
  install -Dm755 target/release/liball_smi_amd.so -t "${pkgdir}/usr/lib/all-smi"
  install -Dm644 docs/man/all-smi.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 packaging/systemd/all-smi.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 debian/all-smi.sysusers "${pkgdir}/usr/lib/sysusers.d/all-smi.conf"
  install -Dm644 debian/all-smi.default "${pkgdir}/etc/default/all-smi"
}
