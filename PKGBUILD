# Maintainer: Simon Brand <simon.brand@postadigitale.de>

pkgname=cryptographic-id-rs
pkgver=0.2.2
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
sha512sums=('6bb8ee6e0c469b96baa06f1d9687787a2d4ad64de116dfb6a870a3677b8e481c81e80a9fbdb51a1c46b219032e5ee159afd2d1658294064b0c92aedd0d9559da'
            '35263ae6d8745022f9a9fab98543459c6977d930cc54a92fe53e149f9b58af798908745696e142f0c7a997d0c9548d6cad408efcc8182fd736a567c76c98f6d0')
b2sums=('2a059ce36ee36af584d42e10195dfa6c973f796e947186e56c18621ecc581e19d2aa0c1c1f19a8e165435714ed6f39d1091f4fc4ac568e9b5bfa992fe3e6622a'
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
