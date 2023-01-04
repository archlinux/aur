# Maintainer: frousties
# Contributor: frousties
_pkgname=tacentview
pkgname=${_pkgname}-git
pkgver=1.0.34.r8.g75da1e0
pkgrel=1
pkgdesc="Tacent View. An image and texture viewer for tga, png, apng, exr, dds, gif, hdr, jpg, tiff, ico, webp, and bmp files."
arch=('i686' 'x86_64')
url="https://github.com/bluescan/${_pkgname}"
license=('ISC')
groups=('')
depends=('gcc' 'libx11' 'cmake' 'ninja' 'dpkg')
options=('!strip' '!emptydirs')
source_x86_64=("git+https://github.com/bluescan/${_pkgname}.git")
sha512sums_x86_64=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "${_pkgname}" -B build -GNinja -DPACKAGE_DEB=True
	ninja -C build install
}

package() {
	# Cleaning some rogue .gitignore lying around
	find . -name ".gitignore" -exec rm -rf {} \;
	
	cd "${srcdir}/build/ViewerInstall/Package/"
	INPUT=$(find . -maxdepth 1 -type d | grep "${_pkgname}_*")
	cp -r "${INPUT}/usr" "${pkgdir}"
}
