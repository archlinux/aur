# Maintainer: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2-git
pkgver=20150617
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2 device"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('Apache' 'GPL')
depends=('libusb' 'glu' 'libcl' 'opencv' 'glfw')
makedepends=('cmake' 'git' 'wget')
provides=('libfreenect2')
conflicts=('libfreenect2')
source=('git+https://github.com/xlz/libfreenect2.git')
md5sums=('SKIP')

build() {
    cd "${srcdir}/libfreenect2";
    git checkout static-libusb;

    cd "${srcdir}/libfreenect2/depends";
    ./install_libusb.sh;

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
};
