# Maintainer: Thomas Braby <thomas@mykolab.com>

_pkgbase=fltk
pkgbase=fltk-git
pkgname=fltk-git
pkgver=1.4.0.r9205.f2544509c
pkgrel=1
pkgdesc='Graphical user interface toolkit for X (Git version)'
arch=('x86_64')
url='http://www.fltk.org/'
license=('LGPL')
depends=('libjpeg' 'libpng' 'zlib' 'libxinerama' 'libxft' 'libxcursor')
makedepends=('git' 'cmake')
provides=('fltk')
conflicts=('fltk')
source=('fltk::git+https://github.com/fltk/fltk.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"

	printf '%s.r%s.%s' \
		"$(cat fltk_version.dat)" \
		"$(git rev-list --count master)" \
		"$(git log -1 --format='%h')"
}

build() {
	cd "${srcdir}/${_pkgbase}"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DCMAKE_BUILD_TYPE='Release' \
		-DFLTK_BUILD_TEST=0 \
		-DOPTION_BUILD_SHARED_LIBS=1

	make
}

package() {
	cd "${srcdir}/${_pkgbase}/build"
	make DESTDIR="${pkgdir}/" install
}

