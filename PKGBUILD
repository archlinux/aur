# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2
_pkgver='0.2-rc2'
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw turbojpeg opencl-headers libcl)
makedepends=(cmake)
source=("https://github.com/OpenKinect/libfreenect2/archive/v${_pkgver}.tar.gz")
sha512sums=('c93ca516e946f40ce97f4fb524840a0a0858275295da826738a92944009258f680770848da7d89ca6e9ad1c1a98919319cbf22f0e622e19c619ea2cdbe2e7ed7')

prepare() {
	cd "${srcdir}/libfreenect2-$_pkgver"
	sed -i -e 's/MODE="0666"/TAG+="uaccess"/' platform/linux/udev/90-kinect2.rules
	sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' examples/CMakeLists.txt
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_CXX11=ON \
		-DENABLE_OPENCL=ON \
		-DBUILD_EXAMPLES=ON
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
