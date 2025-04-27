# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

_pkgname=cryptodev-linux
pkgname=cryptodev-linux-dkms
pkgdesc="Kernel module providing access to Linux kernel cryptographic drivers from userspace - sources"
pkgver=1.14
pkgrel=3
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('dkms')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz"
        "0001-Fix-cryptodev_verbosity-sysctl-for-Linux-6.11-rc1.patch"
        "dkms.conf")
sha256sums=('67223d5bee4749028e78e87372cee3bca79d9a20f7b6cb915aa080c59d2a2d98'
            '6cab9c5c813c06f462c485e37c52c84c5283b197e205424fdc0a7a31ed50e62a'
            '4f48bef024e592b6fc0c44e2eda8231ce61750a293d1ef1bba99765ab3383b75')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-Fix-cryptodev_verbosity-sysctl-for-Linux-6.11-rc1.patch"
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
