# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.1.2
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash')
makedepends=('cmake' 'libxmu')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/tarball/v0.1.2)
md5sums=(d0d7e6cb2775ed2d718f332f49ad3576)
sha256sums=(88cadbea8fb28838bd56a1ec86808325a8f531e93f2bba171e368137d6b1f6e9)
sha384sums=(d4cd69cde26ad8c1ee2ef63bfdeb3381b701bbdd80d9e00fa0e0ae60b2ef2b4c3c343d4496b64ccf2c0f2fa194cbb04b)
sha512sums=(0613e0cfc8fb634d64f086711bfa7e4f3791fd90c8d124ef2a608ff956f21aae7327cccbf3a84216095a6de011901e013f13b1bb42f4e2e63e823d39e859f2c6)

build() {
	cd "${srcdir}/OpenKinect-libfreenect-d311908"
	
	# Install "libfreenect.hpp" to "/usr/include/libfreenect"
	sed 's/DESTINATION include/DESTINATION ${PROJECT_INCLUDE_INSTALL_DIR}/g' -i "wrappers/cpp/CMakeLists.txt"
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" .
	make
}

package() {
	cd "${srcdir}/OpenKinect-libfreenect-d311908"
	
	make DESTDIR="${pkgdir}" install
	install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
	
	# Patch include files
	sed 's/<libfreenect.h>/<libfreenect\/libfreenect.h>/g' -i "${pkgdir}/usr/include/libfreenect/libfreenect.hpp"
}
