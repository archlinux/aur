# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=cryptographic-id-rs
pkgver=0.1.6
pkgrel=1
protocol_ver=0.2.0
pkgdesc='Attest the trustworthiness of a device against a human using asymmetric cryptography'
arch=('x86_64')
url='https://gitlab.com/cryptographic_id/cryptographic-id-rs'
license=(MIT)
depends=(coreutils openssl tpm2-tools util-linux systemd)
makedepends=(cargo rust)
checkdepends=(shellcheck)
backup=('etc/cryptographic_id/initramfs/font')
optdepends=(
  'age: encrypted keys with age'
  'kbd: change console-font for qr-codes'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-rs/-/archive/v${pkgver}/cryptographic-id-rs-v${pkgver}.tar.gz"
  "${pkgname}-proto-${protocol_ver}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-protocol/-/archive/v${protocol_ver}/cryptographic-id-protocol-v${protocol_ver}.tar.gz"
)
sha512sums=('1c15adfb50b9fe653bc551db5e1788aecdf327e1fc8d3a30bdbb95523cdee99f84092dfd138b244b86c8d2c30cc4b250757da462f2241e5b2e7bcdafbe06f68a'
            '35263ae6d8745022f9a9fab98543459c6977d930cc54a92fe53e149f9b58af798908745696e142f0c7a997d0c9548d6cad408efcc8182fd736a567c76c98f6d0')
b2sums=('9ea3db3e6773ce6954998de9e3652e5fd780212026a6ea9f9b4273384cc8133942a909cd01445f456efa786a553915465fa57967a26ec31c171eea59fe59c9c3'
        '14daf4540eb8648b5d14c7b1338cc6d29d0e21bc8794416aaea25c5ae26ab2a159eac582c35e9dd40fab6d99c9a2f8aaf6ab597705737a947bdaec4d54ac3474')

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
