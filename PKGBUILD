# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=g810-led-git
_appname=g810-led
_gitname=g810-led-master
pkgver=0.0.1
pkgrel=1
pkgdesc="Linux led controller for the Logitech G810, G410, G610 and G910 Keyboard"
arch=('i686' 'x86_64')
url="https://github.com/MatMoul/g810-led"
license=('GPL3')
depends=('hidapi')
makedepends=('gcc' 'make')
optdepends=('libusb: alternative USB communication library (slower, more stable)')
conflicts=('g810-led')
install=${pkgname}.install
provides=("g410-led=${pkgver}" "g610-led=${pkgver}" "g810-led=${pkgver}" "g910-led=${pkgver}")
backup=("etc/${_appname}/profile" "etc/${_appname}/reboot")
options=(!emptydirs)
source=("https://github.com/MatMoul/${_appname}/archive/master.zip")
md5sums=('SKIP')

build() {
	cd ${_gitname}
	
	# build with hidapi :
	make
	
  # build with libusb :
  # make LIB=libusb
}

package() {
	cd ${_gitname}
	make DESTDIR="${pkgdir}" setup
	cp ${pkgdir}/etc/${_appname}/samples/group_keys ${pkgdir}/etc/${_appname}/profile
	cp ${pkgdir}/etc/${_appname}/samples/all_off ${pkgdir}/etc/${_appname}/reboot
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
	chmod -R 644 ${pkgdir}/etc/${_appname}/*
	chmod 644 ${pkgdir}/etc/udev/rules.d/${_appname}.rules
	chmod 644 ${pkgdir}/usr/lib/systemd/system/*
}
