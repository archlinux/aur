# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=cryptographic-id-rs
pkgver=0.1.3
pkgrel=1
protover=0.1.0
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
  "${pkgname}-proto-${protover}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-protocol/-/archive/v${protover}/cryptographic-id-protocol-v${protover}.tar.gz"
)
sha256sums=(
  '45b1502d64ddb5599935c26c9a8a68e664b2f23345c1ae0d94fdfd7be09e58ff'
  '526509cabc4ef6e015bcde754fbfbc5879c145e47cf74efc386d06f0921ecd22'
)

prepare() {
  cp "cryptographic-id-protocol-v${protover}"/* "${pkgname}-v${pkgver}/src/cryptographic-id-protocol/"
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
  install -dm 700 "${pkgdir}/etc/cryptographic_id/initramfs/"{insecure,age,cryptsetup,tpm2}
  install -dm 755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/cryptographic_id"
  install -dm 755 "${pkgdir}/usr/lib/initcpio/install"
  install -Dm 755 usr/bin/* "${pkgdir}/usr/bin"
  install -Dm 755 usr/lib/cryptographic_id/* "${pkgdir}/usr/lib/cryptographic_id"
  install -Dm 755 usr/lib/initcpio/install/cryptographic-id "${pkgdir}/usr/lib/initcpio/install/"
  install -Dm 755 target/release/cryptographic-id-rs "${pkgdir}/usr/lib/cryptographic_id"
}
