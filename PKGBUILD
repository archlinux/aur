# Maintainer: James Hogan <james@albanarts.com>

_pkgname="openxr-layer-quad-views-foveated"
pkgname="${_pkgname}-git"
_gitname="Quad-Views-Foveated"
pkgver=1.1.3.r97.gcaf4d68
pkgrel=1
pkgdesc="OpenXR API layer to emulate quad views and foveated rendering support (OpenGL only)"
arch=('x86_64')
url="https://github.com/amalon/${_gitname}"
license=('MIT')
depends=('openxr' 'libglvnd' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glm' 'glslang')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_gitname}::git+https://github.com/amalon/${_gitname}.git")
sha512sums=('SKIP')
validpgpkeys=('9691CFAED3A4DC8623C4D33A774CE9C0981DCA52') # James Hogan

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule init
	git submodule update
}

build() {
	cmake \
	  -B "${srcdir}/${_gitname}/build" \
	  -S "${srcdir}/${_gitname}" \
	  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	  -DCMAKE_INSTALL_LIBDIR=lib
        cmake --build "${srcdir}/${_gitname}/build"
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${srcdir}/${_gitname}/build"
	install -D -m644 "${srcdir}/${_gitname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
