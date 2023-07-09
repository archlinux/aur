# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=cryptographic-id-rs
pkgver=0.2.0
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
sha512sums=('acff06e2b1a498d574c598f45fd25e98433f1bd06263b837af45a6b1339e58548a4b368f43f21294dfe5dcb479b202f83d86221ba56b4437e33c1852bb3cd95c'
            '35263ae6d8745022f9a9fab98543459c6977d930cc54a92fe53e149f9b58af798908745696e142f0c7a997d0c9548d6cad408efcc8182fd736a567c76c98f6d0')
b2sums=('cd395c54f0fdc8143d6332083104cdfce7356fbdbb43bf0059c11029702c40167ef3c662c7aa5d906470009c469445bbb8092abbf221ce8bd524a61db324bfd7'
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
