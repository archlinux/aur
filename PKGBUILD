# Maintainer: Michal Malek <michalm@fastmail.fm>
# Contributor: Sharif Olorin <sio@tesser.org>

pkgname=orthanc
pkgver=1.3.2
pkgrel=1
pkgdesc="Open-source, lightweight DICOM server."
arch=("x86_64" "i686")
url="http://orthanc-server.com/"
license=("custom:GPL3WithOpenSSLException")
source=("https://www.orthanc-server.com/downloads/get.php?path=/orthanc/Orthanc-${pkgver}.tar.gz")
sha256sums=('2357210fb6d7d8d99d5b67c3136abd7e7ec23a92f0946eeb2661aad7e6dcaaf3')
depends=("boost" "curl" "dcmtk" "jsoncpp" "libjpeg-turbo" "libpng" "openssl" "pugixml" "sqlite" "util-linux")
makedepends=("cmake" "doxygen" "gtest" "make" "python")

build() {
	cmake \
		-H${srcdir}/Orthanc-${pkgver} \
		-B${srcdir}/build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DALLOW_DOWNLOADS=ON \
		-DUSE_SYSTEM_LUA=OFF \
		-DUSE_SYSTEM_MONGOOSE=OFF
	cmake --build ${srcdir}/build
	cmake --build ${srcdir}/build --target doc
}

check() {
	cd ${srcdir}/build
	./UnitTests
}

package() {
	cmake --build ${srcdir}/build --target install -- DESTDIR=${pkgdir}
	install -m 444 -D ${srcdir}/Orthanc-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}
	mkdir -p ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin
	rmdir ${pkgdir}/usr/sbin
}
