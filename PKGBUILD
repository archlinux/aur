# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=soapylms7-git
pkgver=r997.2827512
pkgrel=2
pkgdesc="SoapySDR LMS7002M/LimeSDR Support Module"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/pothosware/SoapySDR"
license=('Apache')
depends=('soapysdr' 'libusb>=1.0' 'sqlite')
makedepends=('git' 'cmake')
provides=('soapylms7')
conflicts=('soapylms7')
source=(${pkgname}::"git+https://github.com/myriadrf/LimeSuite.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build && cd build
	cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_PCIE_XILLYBUS:BOOL=OFF -DENABLE_EVB7COM:BOOL=OFF -DENABLE_EVB7COM:BOOL=OFF -DENABLE_GUI:BOOL=OFF -DENABLE_DESKTOP:BOOL=OFF -DENABLE_NOVENARF7:BOOL=OFF
	make -j4
}

package() {
	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
	# Install udev rules, changing mode to 666 and ommitting plugdev group
	mkdir -p "${pkgdir}/etc/udev/rules.d"
	sed 's/MODE="660", GROUP="plugdev"/MODE="666"/g' "${srcdir}/${pkgname}/udev-rules/64-limesuite.rules" > "${pkgdir}/etc/udev/rules.d/64-limesuite.rules"
}
