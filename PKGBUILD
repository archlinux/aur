# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>
# Contributor: yujmo <yujmo94@gmail.com>

pkgname=yujmo_libfreenect2
pkgver=2.1
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw turbojpeg ocl-icd)
makedepends=(cmake opencl-headers)
source=("https://github.com/yujmo/libfreenect2/archive/v${pkgver}.tar.gz")
sha512sums=('c8b2e26f8cdb832edd0171d08af631ac37a5b59339cbd96a020582098396c12e9acf836cc4a98fff459350717129f84ebea51d80186a95e10e8d830c378e6ed7')

prepare() {
	cd "${srcdir}/libfreenect2-$pkgver"
	sed -i -e 's/MODE="0666"/TAG+="uaccess"/' platform/linux/udev/90-kinect2.rules
	sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' examples/CMakeLists.txt
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_CXX11=ON \
		-DENABLE_OPENCL=ON \
		-DENABLE_CUDA=OFF \
		-DBUILD_EXAMPLES=ON
}

build() {
	cd "${srcdir}/libfreenect2-$pkgver"
	make
}

package() {
	cd "${srcdir}/libfreenect2-$pkgver"
	make DESTDIR="${pkgdir}" install
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	install platform/linux/udev/90-kinect2.rules ${pkgdir}/usr/lib/udev/rules.d/65-kinect2.rules
}
