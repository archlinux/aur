# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2
_pkgver='0.1'
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw turbojpeg)
makedepends=(cmake)
source=("https://github.com/OpenKinect/libfreenect2/archive/v${_pkgver}.tar.gz")
sha256sums=('ef4c41c16c2949c8e3513999fdc33160964d693554ed84c05843581c20a809d2')

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
