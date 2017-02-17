# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=limesuite-git
pkgver=r1158.6cf8de1
pkgrel=1
pkgdesc="Driver and GUI for LMS7002M-based SDR platforms (LimeSDR, Novena RF7, etc.)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/myriadrf/LimeSuite"
license=('Apache')
depends=('soapysdr' 'libusb>=1.0' 'sqlite' 'wxgtk' 'freeglut' 'xdg-utils' 'gnuplot' 'python-scipy' 'python-matplotlib')
makedepends=('git' 'cmake')
provides=('soapylms7' 'limesuite')
conflicts=('soapylms7' 'limesuite')
source=(${pkgname}::"git+https://github.com/myriadrf/LimeSuite.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build && cd build
	cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make -j4
}

package() {
	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
	# Install udev rules, changing mode to 666 and ommitting plugdev group
	mkdir -p "${pkgdir}/etc/udev/rules.d"
	sed 's/MODE="660", GROUP="plugdev"/MODE="666"/g' "${srcdir}/${pkgname}/udev-rules/64-limesuite.rules" > "${pkgdir}/etc/udev/rules.d/64-limesuite.rules"
}
