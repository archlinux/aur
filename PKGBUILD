# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2
_pkgver='0.2-rc1'
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw turbojpeg)
makedepends=(cmake)
source=("https://github.com/OpenKinect/libfreenect2/archive/v${_pkgver}.tar.gz")
sha512sums=('d15e2ecb8fbe8a156bfd02bdc534b7fa358fba3f67d8e545121363ffca00f2014f42015a4fe01de6f73a6b5a4f59827f8b7847b5b6322572cf8056abe0da6de7')

prepare() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	sed -i -e 's/MODE="0666"/TAG+="uaccess"/' platform/linux/udev/90-kinect2.rules
	sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' examples/CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CXX11=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=on
}

build() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	make
}

package() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	install platform/linux/udev/90-kinect2.rules ${pkgdir}/usr/lib/udev/rules.d/90-kinect2.rules
}
