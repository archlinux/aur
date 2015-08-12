# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='panther-launcher-git'
pkgdesc='Fork of Slingshot launcher without Elementary dependencies'
pkgver=r9.c8cf97a
pkgrel=1
url='https://github.com/rastersoft/panther_launcher'
license=('GPL3')
arch=('i686' 'x86_64')
source=("${pkgname}::git+${url}")
install='panther-launcher.install'
makedepends=('git' 'vala' 'cmake')
depends=('zeitgeist' 'gnome-menus' 'libgee')
sha512sums=('SKIP')

pkgver () {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	rm -rf build
	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DGSETTINGS_COMPILE=FALSE \
		-DHAVE_ZEITGEIST=TRUE
	make
}

package () {
	cd "${pkgname}/build"
	make DESTDIR="${pkgdir}" install
}

