# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=pcsclite-git
pkgver=pcsc.1.8.20.r58.gfd1e32d
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/pcsclite/"
license=('BSD')
depends=('python2' 'systemd')
makedepends=('pkg-config')
conflicts=("pcsclite")
provides=("pcsclite")
options=('!docs')
source=("git+https://alioth.debian.org/anonscm/git/pcsclite/PCSC.git")
md5sums=('SKIP')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>

pkgver() {
  cd "${srcdir}/PCSC"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/PCSC"

  sed -i -e "s:python:python2:g" src/spy/pcsc-spy
  ./bootstrap
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --enable-libudev \
              --sysconfdir=/etc \
              --enable-ipcdir=/run/pcscd \
              --enable-usbdropdir=/usr/lib/pcsc/drivers \
              --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}


package() {
  cd "${srcdir}/PCSC"

  make DESTDIR="${pkgdir}" install

  install -D -m644 ${srcdir}/PCSC/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/pcsc/drivers
}
