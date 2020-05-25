# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2
pkgver=0.2.0.p1
_commit=e38cf32a4401b904c437fbfdb4051d0d75d9a79b
pkgrel=3
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw libjpeg-turbo ocl-icd)
makedepends=(cmake opencl-headers)
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenKinect/$pkgname/archive/$_commit.tar.gz")
sha512sums=('44319c2ad503f76de31976b5a33ac5963d03fbea6e953b798980b6ca4ba0f8f4388acd7fed07a53fb5930bffde818b77c6b99a82cd90990a43104285a22376c8')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	sed -i -e 's/MODE="0666"/TAG+="uaccess"/' "$srcdir/$pkgname-$_commit/platform/linux/udev/90-kinect2.rules"
	sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' "$srcdir/$pkgname-$_commit/examples/CMakeLists.txt"
	cmake "$srcdir/$pkgname-$_commit" \
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
	install -m644 "$srcdir/$pkgname-$_commit/platform/linux/udev/90-kinect2.rules" "$pkgdir/usr/lib/udev/rules.d/65-kinect2.rules"
}
