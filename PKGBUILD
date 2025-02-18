# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=art-rawconverter-git
pkgver=r10694_068e2997f
pkgrel=1
pkgdesc="rawconverter ART (RawTherapee fork with ease of use in mind) built from latest sources"
arch=('i686' 'x86_64' 'aarch64')
url="https://art.pixls.us"
license=('GPL-3.0-only')
depends=('opencolorio' 'lensfun' 'libraw' 'exiv2' 'fftw' 'gtk3' 'glibmm' 'gtkmm3' 'lcms2' 'libcanberra' 'libiptcdata' 'mimalloc' 'openmp' 'openexr' 'ctl')
options=(!debug !lto)
optdepends=('perl-image-exiftool: metadata support for CR3 images' 'art-rawconverter-imageio: add support for additional image formats' 'art-rawconverter-ctlscripts: CTL scripts for advanced color transformations' 'lcms2-ff: lcms2 with fast-float plugin for improved export speed' )
makedepends=('pkgconf' 'make' 'cmake' 'git' 'gcc' 'hicolor-icon-theme' 'fakeroot')
provides=('art-rawconverter')
source=("${pkgname}_src::git+https://github.com/artpixls/ART.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}_src"
	printf "r%s_%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${pkgname}_build"
	cd "$srcdir/${pkgname}_build"

	cmake "../${pkgname}_src" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCACHE_NAME_SUFFIX="-git" \
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
