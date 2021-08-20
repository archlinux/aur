# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2
pkgver=0.2.1
pkgrel=3
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw libjpeg-turbo ocl-icd)
makedepends=(cmake opencl-headers)
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenKinect/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('0fcee5471deb013d2b57581ef8d8838f652dfed2f457c4240d5b754674e949c59337a167ac74ad04b25ace69af470a7e014e0474a688d930a3323946feadee67')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	sed -i -e 's/MODE="0666"/TAG+="uaccess"/' \
		"$srcdir/$pkgname-$pkgver/platform/linux/udev/90-kinect2.rules"
	sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' \
		"$srcdir/$pkgname-$pkgver/examples/CMakeLists.txt"
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_CXX11=ON \
		-DENABLE_OPENCL=ON \
		-DENABLE_CUDA=OFF \
		-DBUILD_EXAMPLES=ON
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
	install -d "$pkgdir/usr/lib/udev/rules.d"
	install -m644 \
		"$srcdir/$pkgname-$pkgver/platform/linux/udev/90-kinect2.rules" \
		"$pkgdir/usr/lib/udev/rules.d/65-kinect2.rules"
}
