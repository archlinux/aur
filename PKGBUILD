# Maintainer: Alexander Schmidt <zyeryi@gmail.com>

_pkgname=bullycpp
pkgname=${_pkgname}-git
pkgver=v1.0.r6.g52e5f0a
pkgrel=1
pkgdesc="A driver for the Bully Bootloader for the PIC24 and dsPIC33 series of microcontrollers."
arch=('i686' 'x86_64')
url="https://github.com/thirtythreeforty/bullycpp"
license=('GPL3')
depends=('qt5-serialport')
makedepends=('git' 'make' 'gcc')
provides=('BullyCPP')
source=("$_pkgname::git+https://github.com/thirtythreeforty/${_pkgname}.git")
md5sums=('SKIP') 

prepare() {
  mkdir -p build
}

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd build
  qmake PREFIX=/usr "../${_pkgname}/src/bullycpp.pro" CONFIG+=release
  make 
}

package() {
  cd build
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install

  install -D -m644 ../bullycpp/LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 ../../98-serialcable.rules "$pkgdir"/etc/udev/rules.d/98-serialcable.rules
}

# vim: set ts=2 sw=2 et:
