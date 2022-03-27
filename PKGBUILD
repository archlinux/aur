# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=g810-led-lib
_appname=g810-led
_gitname=g810-led
pkgver=0.4.2
pkgrel=1
pkgdesc="Linux led controller for Logitech G213, G410, G413. G512, G513, G610, G810, G815, G910 and GPRO Keyboards. Version with dynamic library"
arch=('any')
url="https://github.com/MatMoul/g810-led"
license=('GPL3')
depends=('hidapi')
makedepends=('git' 'gcc' 'make')
optdepends=('libusb: old implementation, for developpers')
conflicts=('g810-led-git')
install=${pkgname}.install
provides=("g213-led=${pkgver}" "g410-led=${pkgver}" "g413-led=${pkgver}" "g512-led=${pkgver}" "g513-led=${pkgver}" "g610-led=${pkgver}" 
"g810-led=${pkgver}" "g815-led=${pkgver}" "g910-led=${pkgver}" "gpro-led=${pkgver}")
backup=("etc/${_appname}/profile" "etc/${_appname}/reboot" "etc/udev/rules.d/${_appname}.rules")
options=(!emptydirs)
source=("git+https://github.com/MatMoul/${_appname}.git")
#source=("git+https://github.com/MatMoul/${_appname}.git#branch=")
md5sums=('SKIP')

build() {
	cd ${_gitname}
	
	# build with hidapi :
	make bin-linked
	
	# build with libusb :
	# make bin LIB=libusb
}

package() {
	cd ${_gitname}
	make DESTDIR="${pkgdir}" setup
	make DESTDIR="${pkgdir}" install-lib
	make DESTDIR="${pkgdir}" install-dev
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${pkgdir}/etc/${_appname}/samples/group_keys ${pkgdir}/etc/${_appname}/profile
	cp ${pkgdir}/etc/${_appname}/samples/all_off ${pkgdir}/etc/${_appname}/reboot
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
	chmod -R 644 ${pkgdir}/etc/${_appname}/samples/*
	chmod 644 ${pkgdir}/etc/udev/rules.d/${_appname}.rules
	chmod 644 ${pkgdir}/usr/lib/systemd/system/*
	chmod 755 ${pkgdir}/usr/share/licenses/${pkgname}
	chmod 644 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
