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
makedepends=('cmake' 'dpkg' 'git' 'ninja') # dpkg is needed since only building a debian package creates a installation-ready directory structure :-(.
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}"

	mkdir -p build

	## `cmake` call in `prepare()` since it will download stuff.
	cmake -S "${_pkgname}" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DFETCHCONTENT_QUIET=OFF \
		-DPACKAGE_DEB=ON \
		-GNinja
}

build() {
	cd "${srcdir}"
	#cmake -S "${_pkgname}" -B build -GNinja -DPACKAGE_DEB=True -DCMAKE_CXX_COMPILER=gcc-12 -DCMAKE_C_COMPILER=gcc-12
	ninja -C build install
}

package() {
	cd "${srcdir}"
	
	# The name has the short version in it :(
	INPUT=$(find "build/ViewerInstall/Package/" -maxdepth 1 -type d | grep "${_pkgname}_*")
	cp -rv "${INPUT}"/usr "${pkgdir}"/

	# Cleaning some rogue .gitignore lying around
	find "${pkgdir}" -name ".gitignore" -exec rm {} \;
	
	#cd "build/ViewerInstall/Package/"
	#INPUT=$(find . -maxdepth 1 -type d | grep "${_pkgname}_*")
	#cp -r "${INPUT}/usr" "${pkgdir}"
	install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
	cp -rv "${_pkgname}/docs" "${pkgdir}/usr/share/doc/${_pkgname}"/
	
	install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgname}/LICENSE"
	ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
