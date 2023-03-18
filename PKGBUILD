# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

pkgbase=cryptodev-linux
pkgname=cryptodev-linux
pkgdesc="Kernel module providing access to Linux kernel cryptographic drivers from userspace"
pkgver=1.12
pkgrel=2
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('linux')
makedepends=('linux-headers')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${pkgbase}/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938')

build() {
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  make KERNEL_DIR=/usr/src/linux
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"

  local extradir
  extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
  install -Dt "$pkgdir$extradir" -m644 ./*.ko
  find "$pkgdir" -name '*.ko' -exec strip --strip-debug {} +
  find "$pkgdir" -name '*.ko' -exec xz {} +

  install -Dm644 "crypto/cryptodev.h" "${pkgdir}/usr/include/crypto/cryptodev.h"
}
