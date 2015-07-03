# Maintainer: codestation <codestation404@gmail.com>

pkgname=libvitamtp
_pkgname=vitamtp
pkgver=2.5.6
pkgrel=2
_soname=4
pkgdesc="Library to interact with Vita's USB MTP protocol"
arch=("i686" "x86_64")
url="https://github.com/codestation/vitamtp"
license=('GPL')
depends=('libusb' 'libxml2')
conflicts=('vitamtp' 'vitamtpmod')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${_pkgname}/archive/v${pkgver}.tar.gz" "libvitamtp.install")
options=('!libtool')
sha256sums=('1d7c0db20598bcedd8252b1563056e597b336b41d7c2c89786a4c133cc555a43' 'ed499fabb566b06af81f784b87ea2021b74d3945920ab70e8cbdb1b3a88bb9db')
install=$pkgname.install

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # only allow users in the vitamtp group to access the Vita
  sed -i 's/root/vitamtp/' debian/vitamtp${_soname}.udev
  sed -i 's/666/660/' debian/vitamtp${_soname}.udev

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/vitamtp${_soname}.udev "$pkgdir/usr/lib/udev/rules.d/80-psvita.rules"
}
