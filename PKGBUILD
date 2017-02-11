# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=g810-led-git
_appname=g810-led
_gitname=g810-led
pkgver=0.0.1
pkgrel=6
pkgdesc="Linux led controller for Logitech G410, G610, G810 and G910 Keyboards"
arch=('i686' 'x86_64')
url="https://github.com/MatMoul/g810-led"
license=('GPL3')
depends=('hidapi')
makedepends=('git' 'gcc' 'make')
optdepends=('libusb: old implementation, use only if you have problem with hidapi')
conflicts=('g810-led')
install=${pkgname}.install
provides=("g410-led=${pkgver}" "g610-led=${pkgver}" "g810-led=${pkgver}" "g910-led=${pkgver}")
backup=("etc/${_appname}/profile" "etc/${_appname}/reboot")
options=(!emptydirs)
source=("git://github.com/MatMoul/${_appname}.git")
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
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${pkgdir}/etc/${_appname}/samples/group_keys ${pkgdir}/etc/${_appname}/profile
	cp ${pkgdir}/etc/${_appname}/samples/all_off ${pkgdir}/etc/${_appname}/reboot
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
	chmod -R 644 ${pkgdir}/etc/${_appname}/*
	chmod 644 ${pkgdir}/etc/udev/rules.d/${_appname}.rules
	chmod 644 ${pkgdir}/usr/lib/systemd/system/*
	chmod 755 ${pkgdir}/usr/share/licenses/${pkgname}
	chmod 644 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
