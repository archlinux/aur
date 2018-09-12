# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=pcsclite-nopy
_pkgname=pcsclite
pkgver=1.8.23
pkgrel=3
pkgdesc="PC/SC Architecture smartcard middleware library (no python)"
arch=('x86_64' 'i686')
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('libsystemd')
makedepends=('pkg-config' 'python')
optdepends=('python: to use pcsc-spy tool')
options=('!docs')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.bz2")
sha256sums=('5a27262586eff39cfd5c19aadc8891dd71c0818d3d629539bd631b958be689c9')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)

build() {
  cd "${srcdir}/pcsc-lite-${pkgver}"

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --enable-filter \
              --enable-ipcdir=/run/pcscd \
              --enable-libudev \
              --enable-usbdropdir=/usr/lib/pcsc/drivers \
              --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "${srcdir}/pcsc-lite-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m644 ${srcdir}/pcsc-lite-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/pcsc/drivers
}
