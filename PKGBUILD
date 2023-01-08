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
backup=('etc/cryptographic_id/initramfs/font')
optdepends=(
  'age: encrypted keys with age'
  'kbd: change console-font for qr-codes'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-rs/-/archive/v${pkgver}/cryptographic-id-rs-v${pkgver}.tar.gz"
  "${pkgname}-proto-${protocol_ver}.tar.gz::https://gitlab.com/cryptographic_id/cryptographic-id-protocol/-/archive/v${protocol_ver}/cryptographic-id-protocol-v${protocol_ver}.tar.gz"
)
sha512sums=('83e4d53664967288c89c5d7544f58e6e07ca0a852cd2152a14ff8f974c732737923a84e117f25d7614d26752a5c0b062bddd8e976095a38481342523c13af284'
            '328a37f16ca4ca20f4ef9e978e2a88bbb28e685837c74ec6b687f41324739f03b24765896daf03bde88b42134784223fa4457de7edb61ef699bb31a9de78ece2')
b2sums=('0ac2b7bef3ee1b200456aa70e8063f09bf87c9ecbcb0a28067f50394f62cac7575c28bfca9cbccf50e71bcabd3d3120780901bd10c4930b2ce8d30eec4c58193'
        'bec00059a589f26799ea500461d1038becd5642fe1d55b0191dbd1ed961f80bb29fb380768b8826bcd72a3c2cde1daacc263fde8f58820a5a8cb2b5e2de94069')

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
