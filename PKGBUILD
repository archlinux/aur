# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

_pkgname=cryptodev-linux
pkgname=cryptodev-linux-dkms
pkgname=cryptodev-linux-dkms
pkgdesc="Kernel module providing access to Linux kernel cryptographic drivers from userspace - sources"
pkgver=1.13
pkgrel=3
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('dkms')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz"
        "dkms.conf")
sha256sums=('33b7915c46eb39a37110e88c681423c0dd0df25d784b6e1475ac3196367f0db5'
            '4c762bbea27edeb283d44af37be2faf2df21312853b200e6b93319d563f51d86')

# Newer Linux kernels support
source+=("0001-linux-6.5.patch::https://github.com/cryptodev-linux/cryptodev-linux/commit/592017c3a910a3905b1925aee88c4674e9a596b7.patch?full_index=1"
         "0002-linux-6.5.patch::https://github.com/cryptodev-linux/cryptodev-linux/commit/99ae2a39ddc3f89c66d9f09783b591c0f2dbf2e9.patch?full_index=1"
         "0003-linux-6.5.patch::https://github.com/cryptodev-linux/cryptodev-linux/commit/bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f.patch?full_index=1"
         "0001-linux-6.7.patch::https://github.com/cryptodev-linux/cryptodev-linux/commit/5e7121e45ff283d30097da381fd7e97c4bb61364.patch?full_index=1")
sha256sums+=('d8fd96d4e3c2a0a2e89155a552f5a909e9fbfb6275e01013d59fe74390f68355'
             '8af6ef9a28f0c13f3246fa76ca05993cf2b193eacb9d6b9dbae92e40cef92dae'
             'c4a3ef3473dbb8cadd1a2815473d16b139c007bbc6054c4a9ede89fd6a4766f2'
             '9c42fd653b80bf2fbf66b3511fbfa5a6408de9ba4f0191b22326a2a46f7318d0')
prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  patch -Np1 -i ../0001-linux-6.5.patch
  patch -Np1 -i ../0002-linux-6.5.patch
  patch -Np1 -i ../0003-linux-6.5.patch
  patch -Np1 -i ../0001-linux-6.7.patch
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
  cp -r ./* "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
  sed -e "s/@PKGBASE@/${_pkgname}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  install -Dm644 "crypto/cryptodev.h" "${pkgdir}/usr/include/crypto/cryptodev.h"
}
