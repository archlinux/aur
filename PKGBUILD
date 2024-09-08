# Maintainer: frousties
# Contributor: frousties
_pkgname=tacentview
pkgname=${_pkgname}-git
pkgver=1.0.45.9.gcd78fb8
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent."
arch=('any')
url="https://github.com/bluescan/${_pkgname}"
license=('ISC')
provides=("${_pkgname}=${pkgver}")
provides=(${_pkgname})
conflicts=("tacentview")
depends=('clang' 'hicolor-icon-theme' 'libx11' 'libxcb')
makedepends=('cmake' 'git' 'ninja')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

prepare() {
	export CC=/usr/bin/clang
	export CXX=/usr/bin/clang++
	
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
	DEB_TEMPLATE="${_pkgname}/Linux/deb_template/usr"

	# Installing the program's binaries
	install -D -m755 build/ViewerInstall/${_pkgname} -t "${pkgdir}/usr/bin/"
	
	# Installing the program's data
	install -D -m644 build/ViewerInstall/Assets/* -t "${pkgdir}/usr/share/${_pkgname}/Assets/"
    
	# Installing the desktop file
    install -D -m644 ${DEB_TEMPLATE}/share/applications/* -t "${pkgdir}/usr/share/applications/"
	
	# Installing the docs
	install -D -m644 ${_pkgname}/docs/* -t "${pkgdir}/usr/share/doc/${_pkgname}"
	
	# Installing the licenses
	install -D -m644 ${_pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	
	# Installing the icon files (quick and dirty solution due to the complex structure)
	cd ${DEB_TEMPLATE}/share/icons/
	find ./* -type f -exec install -D -m644 "{}" "${pkgdir}/usr/share/icons/{}" \;
}
