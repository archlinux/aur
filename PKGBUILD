# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=pcsclite-git
pkgver=pcsc.1.8.23.r0.g09f0f85
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library"
arch=('x86_64')
url="https://alioth.debian.org/projects/pcsclite/"
license=('BSD')
depends=('python' 'systemd')
makedepends=('pkg-config' 'git')
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
  sed -i "/^AC\_INIT/ { s,]),-git]), }" configure.ac
  ./bootstrap
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
  cd "${srcdir}/PCSC"

  make DESTDIR="${pkgdir}" install

  install -D -m644 ${srcdir}/PCSC/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/pcsc/drivers
}
