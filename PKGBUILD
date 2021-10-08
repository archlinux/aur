# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gdtoa-desktop-git
pkgver=r30.698924a
pkgrel=1
pkgdesc="Binary-decimal floating-point conversion library by David M. Gay"
arch=('i686' 'x86_64')
conflicts=("gdtoa-desktop")
provides=("gdtoa-desktop")
url="https://github.com/10110111/gdtoa-desktop"
license=('Lucent')
depends=('git')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/10110111/gdtoa-desktop")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p build
}

build() {
	cd "${srcdir}/${pkgname}"

	cd build
	cmake .. -Wno-dev \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	cd build
	make DESTDIR="${pkgdir}" install

	if test -d "${pkgdir}"/usr/lib64; then
		mkdir -p "${pkgdir}"/usr/lib
		mv -fv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib/
		rmdir "${pkgdir}"/usr/lib64
	fi
}
