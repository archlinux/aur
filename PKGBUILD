# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2
pkgver=0.2.0
pkgrel=4
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw turbojpeg ocl-icd)
makedepends=(cmake opencl-headers)
source=("https://github.com/OpenKinect/libfreenect2/archive/v${pkgver}.tar.gz")
sha512sums=('3525e3f21462cecd3b198f64545786ffddc2cafdfd8146e5a46f0300b83f29f1ad0739618a07ab195c276149d7e2e909f7662e2d379a2880593cac75942b0666')

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
