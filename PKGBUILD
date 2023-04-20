# Maintainer: René Wagner <rwagner at rw-net dot de>
pkgname=art-rawconverter-git
pkgver=r10297_b8043981b
pkgrel=1
pkgdesc="Rawconverter ART including blackfoxx-Theme built from latest sources"
arch=('i686' 'x86_64' 'aarch64')
url="https://bitbucket.org/agriggio/art/wiki/Home"
license=('GPL3')
depends=('opencolorio' 'lensfun' 'libraw' 'exiv2' 'fftw' 'gtk3' 'glibmm' 'gtkmm3' 'lcms2' 'libcanberra' 'libiptcdata' 'desktop-file-utils' 'mimalloc' 'openmp')
optdepends=('perl-image-exiftool: metadata support for CR3 images' 'art-rawconverter-imageio: add support for additional image formats' 'lcms2-ff: lcms2 with fast-float plugin for improved export speed' )
makedepends=('pkgconf' 'make' 'cmake' 'git' 'gcc' 'hicolor-icon-theme' 'fakeroot')
conflicts=('art-rawconverter')
provides=('art-rawconverter')
source=("${pkgname}_src::git+https://bitbucket.org/agriggio/art.git#branch=master" "bft_20.zip::https://discuss.pixls.us/uploads/short-url/fG7iCaIWBWBem30O67V15EfO521.zip")
sha256sums=('SKIP' '7381c57e48b1437bec6b775029370f99f6fc14eced53678972e9f0b7e02a4346')

pkgver() {
	cd "$srcdir/${pkgname}_src"
	printf "r%s_%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cp "$srcdir/blackfoxx-GTK3-20_.css" "$srcdir/${pkgname}_src/rtdata/themes"

	mkdir -p "$srcdir/${pkgname}_build"
	cd "$srcdir/${pkgname}_build"

	cmake "../${pkgname}_src" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCACHE_NAME_SUFFIX="-git" \
		-DCMAKE_BUILD_TYPE=Release \
		-DPROC_TARGET_NUMBER=2 \
		-DWITH_LTO="ON" \
		-DENABLE_LIBRAW="ON" \
		-DENABLE_OCIO="ON" \
		-DBUILD_SHARED="ON"

 	make
}

package() {
	cd "$srcdir/${pkgname}_build"
	make DESTDIR="$pkgdir/" install
}
