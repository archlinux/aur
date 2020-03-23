# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname="piglit"
pkgname="${_pkgname}-git"
pkgver=r10943.cdb765a36
pkgrel=1
pkgdesc="OpenGL implementation testing suite. Provides a simple means to perform regression tests."
arch=('i686' 'x86_64')
url="http://piglit.freedesktop.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
depends=('waffle' 'python-mako' 'python-numpy' 'libxrender' 'glu' 'libcaca' 'libxkbcommon')
optdepends=('python-lxml: Accelerated python XML library using libxml2'
            'python-simplejson: Fast implementation of the python JSON library'
            'python-jsonstreams: A JSON stream writer for python'
            'vkrunner: Vulkan shader script testing')
makedepends=('git' 'cmake' 'xorgproto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
install="${_pkgname}.install"
source=("git+https://gitlab.freedesktop.org/mesa/piglit.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		.
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install

	cd "${pkgdir}/usr/lib/piglit/lib/"
	find . -name "*.so" -exec ln -s "{}" "../../{}" \;
}
