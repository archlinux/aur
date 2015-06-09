# Maintainer: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2-git
pkgver=20150609
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2 device"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('Apache' 'GPL')
depends=('libusb' 'glu' 'libcl' 'opencv' 'glfw')
makedepends=('cmake' 'git' 'wget')
provides=('libfreenect2')
conflicts=('libfreenect2')
source=('git+https://github.com/OpenKinect/libfreenect2.git' 'CMakeLists.diff')
md5sums=('SKIP'
         'c55aaebc4ea42143566af749e388ef96')

build() {
	patch ${srcdir}/libfreenect2/examples/protonect/CMakeLists.txt CMakeLists.diff;
	cd "${srcdir}/libfreenect2/depends";
	./install_glfw.sh;
	./install_ubuntu.sh;

	cd "${srcdir}/libfreenect2/examples/protonect";
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CXX11=ON -DLibUSB_LIBRARIES=usb-1.0;
	make;
};

package() {
	cd "${srcdir}/libfreenect2/examples/protonect";
	make DESTDIR="${pkgdir}" install;
	mkdir -p ${pkgdir}/usr/bin;
	install bin/Protonect ${pkgdir}/usr/bin/Protonect;
	cd "${srcdir}/libfreenect2";
	mkdir -p ${pkgdir}/etc/udev/rules.d;
	install rules/90-kinect2.rules ${pkgdir}/etc/udev/rules.d/90-kinect2.rules;
	mkdir -p ${pkgdir}/usr/lib/libfreenect2;
	install depends/libusb/lib/libusb-1.0.so ${pkgdir}/usr/lib/libfreenect2/libusb-1.0.so;
	install depends/libusb/lib/libusb-1.0.so.0 ${pkgdir}/usr/lib/libfreenect2/libusb-1.0.so.0;
	install depends/libusb/lib/libusb-1.0.so.0.1.0 ${pkgdir}/usr/lib/libfreenect2/libusb-1.0.so.0.1.0;
};
