# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Wayland bridge/frameserver for Arcan'
pkgname='arcan-waybridge-git'
pkgver=0.5.4.6.r10.gdb2f991e
pkgrel=1
license=('GPL2' 'LGPL' 'custom:BSD')
arch=('x86_64')
depends=('wayland' 'arcan')
makedepends=('cmake' 'wayland-protocols' 'git')
provides=('arcan-waybridge')
conflicts=('arcan-waybridge')
url='https://arcan-fe.com/'
source=("${pkgname}::git+https://github.com/letoram/arcan.git")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	rm -rf "${pkgname}/build"
	mkdir "${pkgname}/build"
	cd "${pkgname}/build"
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		../src/tools/waybridge
	make
}

package () {
	cd "${pkgname}/build"
	DESTDIR="${pkgdir}" make install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../COPYING
}
