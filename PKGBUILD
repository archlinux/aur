# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=cryptographic-id-rs
pkgver=0.2.1
pkgrel=1
protocol_ver=0.2.0
pkgdesc='Attest the trustworthiness of a device against a human using asymmetric cryptography'
arch=('x86_64')
url='https://gitlab.com/cryptographic_id/cryptographic-id-rs'
license=(MIT)
depends=(coreutils openssl tpm2-tools util-linux systemd)
makedepends=(cargo rust protobuf)
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
sha512sums=('9a8266e8db230b6974b528b11079d5a6eedb033f2916c3961d409c86c9eb7905272c296c3522c6bf4bc29df6ba72af1ed200366388253cb5787936928ee034b3'
            '35263ae6d8745022f9a9fab98543459c6977d930cc54a92fe53e149f9b58af798908745696e142f0c7a997d0c9548d6cad408efcc8182fd736a567c76c98f6d0')
b2sums=('0e9d296cb5ef3800f63e5ccb746db8b064d6b9ef7a7acd9003f22c2b5062b83877ea2fec4192f23ac86b201379ab2b6d14b2602cbfdf4c05f39775809e4ecae4'
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
  shellcheck usr/bin/* usr/lib/cryptographic_id/* usr/lib/initcpio/install/cryptographic-id \
	  usr/lib/dracut/modules.d/90cryptographic-id/module-setup.sh
}

package() {
  cd "${pkgname}-v${pkgver}"
  make install DESTDIR="${pkgdir}"
}
