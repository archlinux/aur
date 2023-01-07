# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=cryptographic-id-rs
pkgver=0.1.5
pkgrel=1
protocol_ver=0.1.0
pkgdesc='Attest the trustworthiness of a device against a human using asymmetric cryptography'
arch=('x86_64')
url='https://gitlab.com/cryptographic_id/cryptographic-id-rs'
license=(MIT)
depends=(coreutils openssl tpm2-tools util-linux systemd)
makedepends=(cargo rust)
checkdepends=(shellcheck)
optdepends=(
  'age: encrypted keys with age'
  'kbd: change console-font for qr-codes'
)
backup=()
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-rs/-/archive/v${pkgver}/cryptographic-id-rs-v${pkgver}.tar.gz"
  "${pkgname}-proto-${protocol_ver}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-protocol/-/archive/v${protocol_ver}/cryptographic-id-protocol-v${protocol_ver}.tar.gz"
)
sha256sums=(
  '4addef916a8c777da5200dcfe80eb2520a207796bb631a858889780e376e7db0'
  '526509cabc4ef6e015bcde754fbfbc5879c145e47cf74efc386d06f0921ecd22'
)

prepare() {
  cp "cryptographic-id-protocol-v${protocol_ver}"/* "${pkgname}-v${pkgver}/src/cryptographic-id-protocol/"
  cd "${pkgname}-v${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-v${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-v${pkgver}"
  shellcheck usr/bin/* usr/lib/cryptographic_id/* usr/lib/initcpio/install/cryptographic-id
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -dm 755 "${pkgdir}/etc/cryptographic_id"
  install -dm 700 "${pkgdir}/etc/cryptographic_id/initramfs"
  install -dm 700 "${pkgdir}/etc/cryptographic_id/initramfs/"{insecure,age,cryptsetup,tpm2}
  install -dm 755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/cryptographic_id"
  install -dm 755 "${pkgdir}/usr/lib/initcpio/install"
  install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  install -m 600 /dev/null "${pkgdir}/etc/cryptographic_id/initramfs/font"
  install -Dm 755 usr/bin/* "${pkgdir}/usr/bin"
  install -Dm 644 usr/lib/cryptographic_id/* "${pkgdir}/usr/lib/cryptographic_id"
  install -Dm 755 target/release/cryptographic-id-rs "${pkgdir}/usr/lib/cryptographic_id"
  install -Dm 644 usr/lib/initcpio/install/cryptographic-id "${pkgdir}/usr/lib/initcpio/install"
  install -Dm 644 usr/lib/systemd/system/* "${pkgdir}/usr/lib/systemd/system"
}
