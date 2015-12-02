# Maintainer: Maarten de Vries

pkgname=libfreenect2
_pkgver='0.1-rc1'
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2 device"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glu libcl glfw turbojpeg)
makedepends=(cmake)
source=("https://github.com/OpenKinect/libfreenect2/archive/v${_pkgver}.tar.gz")
sha256sums=('ae337fc301b506f87a9bfb4baad891600e464c81abae3c646e201ed7720a3305')

prepare() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	sed -i -e 's/MODE="0666"/TAG+="uaccess"/' "rules/90-kinect2.rules"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CXX11=ON
	cd "${srcdir}/libfreenect2-$_pkgver/examples"
	cmake
}

build() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	make
	cd "${srcdir}/libfreenect2-$_pkgver/examples"
	make
}

package() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/usr/bin
	install bin/Protonect ${pkgdir}/usr/bin/Protonect
	mkdir -p ${pkgdir}/etc/udev/rules.d
	install rules/90-kinect2.rules ${pkgdir}/etc/udev/rules.d/90-kinect2.rules
}
