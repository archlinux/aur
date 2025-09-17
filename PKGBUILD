# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter
pkgver=1.25.9
pkgrel=1
pkgdesc="raw image converter ART (forked from RawTherapee with ease of use in mind)"
arch=('i686' 'x86_64' 'aarch64')
url="https://art.pixls.us/"
license=('GPL-3.0-only')
options=(!debug !lto)
depends=('opencolorio' 'lensfun' 'libraw' 'exiv2' 'fftw' 'gtk3' 'glibmm' 'gtkmm3' 'lcms2' 'libcanberra' 'libiptcdata' 'mimalloc' 'openmp' 'openexr' 'ctl')
optdepends=('perl-image-exiftool: metadata support for CR3 images' 'art-rawconverter-imageio: add support for additional image formats' 'art-rawconverter-ctlscripts: CTL scripts for advanced color transformations' 'lcms2-ff: lcms2 with fast-float plugin for improved export speed' )
makedepends=('pkgconf' 'cmake' 'make' 'git' 'gcc' 'hicolor-icon-theme' 'fakeroot')
conflicts=('art-rawconverter-git')
source=("${pkgname}_${pkgver}::https://github.com/artpixls/ART/archive/refs/tags/${pkgver}.tar.gz")

build() {
	mkdir -p "$srcdir/${pkgname}_build"
	cd "$srcdir/${pkgname}_build"

	cmake "../ART-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DPROC_TARGET_NUMBER=2 \
		-DENABLE_LIBRAW="ON" \
		-DENABLE_OCIO="ON" \
		-DOPTION_OMP="ON" \
		-DBUILD_SHARED="ON" \
		-DENABLE_CTL="ON" \
		-DCTL_INCLUDE_DIR="/usr/include/CTL"

	make
}

package() {
	cd "$srcdir/${pkgname}_build"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('3276a4eb3fd8d9aa1829611b76d17c41f361619ab7f1809ef6e60d3bf5ef56f8')
