# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='panther-launcher-git'
pkgdesc='Fork of Slingshot launcher without Elementary dependencies'
pkgver=1.13.0.r5.gbdb7d63
pkgrel=1
url='https://gitlab.com/rastersoft/panther_launcher'
license=(GPL-3.0-only)
arch=('i686' 'x86_64')
source=("${pkgname}::git+${url}")
makedepends=('git' 'vala' 'cmake')
depends=('gnome-menus' 'libgee' 'gtk3' 'libsoup' 'gnome-icon-theme' 'mate-panel')
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
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DGSETTINGS_COMPILE=OFF \
		-DHAVE_ZEITGEIST=OFF \
		-DDISABLE_FLASHBACK=ON \
		-DDISABLE_MATE=OFF
	make
}

package () {
	cd "${pkgname}/build"
	make DESTDIR="${pkgdir}" install
        rm -rv "${pkgdir}/usr/share/dbus-1/system.d/"
}

