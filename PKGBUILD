# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

pkgbase=cryptodev-linux
pkgname=(cryptodev-linux cryptodev-linux-dkms)
pkgdesc="cryptodev Linux module"
pkgver=1.10
pkgrel=3
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('linux-headers')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${pkgbase}/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz"
        "https://github.com/${pkgbase}/${pkgbase}/commit/f971e0cd4a0ebe59fb2e8e17240399bf6901b09b.patch"
        "https://github.com/${pkgbase}/${pkgbase}/commit/98b163a23f6b9fbdc18c3644cf94a75cdcd0cc80.patch"
        "dkms.conf")
sha256sums=('833ab7c5c88d2b700a7c702a151254c089a3058886a63cc7d12630e364b8ea83'
            '66bb2786fcc5d05d5877280c797dee9a835a1ca87c5a78d400cd8310c738a4e6'
            'a536b375e59cc39119082a0cb30e8463e3df5094028652a49640e7d1baebc92f'
            '4c762bbea27edeb283d44af37be2faf2df21312853b200e6b93319d563f51d86')
install=${pkgbase}.install

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}/f971e0cd4a0ebe59fb2e8e17240399bf6901b09b.patch"
  patch -Np1 -i "${srcdir}/98b163a23f6b9fbdc18c3644cf94a75cdcd0cc80.patch"
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  make KERNEL_DIR=/usr/src/linux
}

package_cryptodev-linux() {
  pkgdesc="cryptodev Linux module"
  depends=('linux')

  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  make INSTALL_MOD_PATH="${pkgdir}"/usr DESTDIR="${pkgdir}" PREFIX="${pkgdir}" KERNEL_DIR=/usr/src/linux install
  rm -Rf "${pkgdir}"/usr/lib/modules/*/modules.*
}

package_cryptodev-linux-dkms() {
  pkgdesc="cryptodev Linux module sources"
  depends=('dkms')

  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  install -d "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
  cp -r ./* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

  # TODO: Is there some better way to avoid copying the files created
  #       during the build process to the DKMS folder?
  find "${pkgdir}/usr/src/${pkgbase}-${pkgver}/" -name "*.o" -type f -delete
  rm -f "${pkgdir}/usr/src/${pkgbase}-${pkgver}/Module.symvers"
  rm -f "${pkgdir}/usr/src/${pkgbase}-${pkgver}/cryptodev.ko"
  rm -f "${pkgdir}/usr/src/${pkgbase}-${pkgver}/cryptodev.mod"
  rm -f "${pkgdir}/usr/src/${pkgbase}-${pkgver}/cryptodev.mod.c"
  rm -f "${pkgdir}/usr/src/${pkgbase}-${pkgver}/modules.order"
  rm -f "${pkgdir}/usr/src/${pkgbase}-${pkgver}/version.h"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
  sed -e "s/@PKGBASE@/${pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"

  install -Dm644 "crypto/cryptodev.h" "${pkgdir}/usr/include/crypto/cryptodev.h"
}
