# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

pkgbase=cryptodev-linux
pkgname=cryptodev-linux
pkgdesc="Kernel module providing access to Linux kernel cryptographic drivers from userspace"
pkgver=1.14
pkgrel=3
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('linux')
makedepends=('linux-headers')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${pkgbase}/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz"
        "0001-Fix-cryptodev_verbosity-sysctl-for-Linux-6.11-rc1.patch"
        "0001-Fix-build-for-Linux-6.18-rc1.patch")
sha256sums=('67223d5bee4749028e78e87372cee3bca79d9a20f7b6cb915aa080c59d2a2d98'
            '6cab9c5c813c06f462c485e37c52c84c5283b197e205424fdc0a7a31ed50e62a'
            '1ec54ad33558812a0e7af6a540a64b338524928647f7dc811e8058e022939812')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-Fix-cryptodev_verbosity-sysctl-for-Linux-6.11-rc1.patch"
  patch -Np1 -i "${srcdir}/0001-Fix-build-for-Linux-6.18-rc1.patch"
}

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
