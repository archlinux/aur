# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname="piglit"
pkgname="${_pkgname}-git"
pkgver=r12182.2842979eb
pkgrel=1
pkgdesc="OpenGL implementation testing suite. Provides a simple means to perform regression tests."
arch=('i686' 'x86_64')
url="http://piglit.freedesktop.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
depends=('waffle' 'python-mako' 'python-numpy' 'libxrender' 'glu' 'libcaca' 'libxkbcommon' 'ocl-icd' 'vulkan-icd-loader')
optdepends=('python-lxml: Accelerated python XML library using libxml2'
            'python-simplejson: Fast implementation of the python JSON library'
            'python-jsonstreams: A JSON stream writer for python'
            'vkrunner: Vulkan shader script testing')
makedepends=('git' 'cmake' 'ninja' 'xorgproto' 'vulkan-headers' 'opencl-headers' 'glslang' 'wayland-protocols')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
install="${_pkgname}.install"
source=("git+https://gitlab.freedesktop.org/mesa/piglit.git"
        "https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1057.diff")
sha256sums=('SKIP'
            '4eff7d424f4b1e2e79b098da81e1433abfdbdaafbedd2a7099a093591d6e5daa')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	patch -p1 < "${srcdir}/1057.diff"
}

build() {
	cd "${_pkgname}"
	cmake -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DPIGLIT_BUILD_CL_TESTS=1 \
		.
	cmake --build .
}

package() {
	cd "${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install .

	cd "${pkgdir}/usr/lib/piglit/lib/"
	find . -name "*.so" -exec ln -s "{}" "../../{}" \;
}
