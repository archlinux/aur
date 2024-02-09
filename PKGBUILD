# Maintainer: frousties
# Contributor: frousties
_pkgname=tacentview
pkgname=${_pkgname}-git
pkgver=1.0.43.9.gdfff366
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent."
arch=('any')
url="https://github.com/bluescan/${_pkgname}"
license=('ISC')
provides=("${_pkgname}=${pkgver}")
provides=(${_pkgname})
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxcb')
makedepends=('cmake' 'dpkg' 'git' 'ninja') # dpkg is the simplest way to create an installation-ready directory structure with how the project is made :(
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}"

	mkdir -p build

	# `cmake` call in `prepare()` since it will download stuff.
	cmake -S "${_pkgname}" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DFETCHCONTENT_QUIET=OFF \
		-DPACKAGE_DEB=ON \
		-GNinja
}

build() {
	cd "${srcdir}"
	
	# We build!
	ninja -C build install
}

package() {
	cd "${srcdir}"
	
	# Copy the program's user data
	INPUT=$(find "build/ViewerInstall/Package/" -maxdepth 1 -type d | grep "${_pkgname}_*") # The name is mutable, so, let's not bother
	cp -rv "${INPUT}"/usr "${pkgdir}"/

	# Cleaning some rogue .gitignore lying around
	find "${pkgdir}" -name ".gitignore" -exec rm {} \;
	
	# Installing the docs
	install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
	cp -rv "${_pkgname}/docs" "${pkgdir}/usr/share/doc/${_pkgname}"/
	
	# Installing the licenses
	install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgname}/LICENSE"
	ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
