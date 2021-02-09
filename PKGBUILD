# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

pkgbase=cryptodev-linux
pkgname=(cryptodev-linux cryptodev-linux-dkms)
pkgdesc="Kernel module providing access to Linux kernel cryptographic drivers from userspace"
pkgver=1.12
pkgrel=1
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('linux-headers')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${pkgbase}/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz"
        "dkms.conf")
sha256sums=('f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938'
            '4c762bbea27edeb283d44af37be2faf2df21312853b200e6b93319d563f51d86')
install=${pkgbase}.install

build() {
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  make KERNEL_DIR=/usr/src/linux
}

package_cryptodev-linux() {
  depends=('linux')

  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  make INSTALL_MOD_PATH="${pkgdir}"/usr DESTDIR="${pkgdir}" PREFIX="${pkgdir}" KERNEL_DIR=/usr/src/linux install
  rm -Rf "${pkgdir}"/usr/lib/modules/*/modules.*
}

package_cryptodev-linux-dkms() {
  pkgdesc+=" - sources"
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
