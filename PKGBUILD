# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Sorah Fukumori <sorah@cookpad.com>

_pkgname=pigpio
pkgname=${_pkgname}-git
pkgver=76.0.g30e6b35
pkgrel=1
pkgdesc='A C library to control the Raspberry Pi GPIOs. Development version.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/joan2937/pigpio'
license=('custom:UNLICENCE')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "python-${_pkgname}")

source=("git+https://github.com/joan2937/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	cd "${srcdir}"
	cp -a ${_pkgname} build/

	cd build
	sed -ri '/which python/d' Makefile
	sed -ri '/\/opt/d' Makefile
	sed -ri 's|\$\(prefix\)/man|\$\(prefix\)/share/man|' Makefile
	sed -ri 's|/usr/bin/pigpiod|/usr/bin/pigpiod -g|' util/pigpiod.service
}

build() {
	cd "${srcdir}"/build
	make
}

package() {
	cd "${srcdir}"/build
	make prefix=/usr DESTDIR="${pkgdir}" install

	mkdir -p "${pkgdir}"/usr/lib/systemd/system
	cp -a util/pigpiod.service "${pkgdir}"/usr/lib/systemd/system/

	mkdir -p "${pkgdir}"/usr/share/licenses/$pkgname
	cp -a UNLICENCE "${pkgdir}"/usr/share/licenses/$pkgname/
}
