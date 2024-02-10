# Maintainer: frousties
# Contributor: frousties
_pkgname=tacentview
pkgname=${_pkgname}-git
pkgver=1.0.43.9.gdfff366
pkgrel=2
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent."
arch=('any')
url="https://github.com/bluescan/${_pkgname}"
license=('ISC')
provides=("${_pkgname}=${pkgver}")
provides=(${_pkgname})
depends=('gcc-libs' 'hicolor-icon-theme' 'libx11' 'libxcb')
makedepends=('cmake' 'git' 'ninja')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

prepare() {
	# `cmake` call in `prepare()` since it will download stuff.
	cmake -S "${_pkgname}" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DFETCHCONTENT_QUIET=OFF \
		-GNinja
}

build() {
	# We build!
	ninja -C build install
}

package() {
	# Installing the program's binaries
	install -Dm755 build/ViewerInstall/${_pkgname} -t "${pkgdir}/usr/bin"
	
	# Installing the program's data
	install -Dm644 build/ViewerInstall/Data/* -t "${pkgdir}/usr/share/${_pkgname}/Data"
	
	# Installing the docs
	install -Dm644 ${_pkgname}/docs/* -t "${pkgdir}/usr/share/doc/${_pkgname}"
	
	# Installing the licenses
	install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
