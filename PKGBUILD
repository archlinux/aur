# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=stlink-git
pkgrel=1
pkgver=r1788.eeaef98
pkgdesc="stm32 discovery line linux programmer."
arch=('i686' 'x86_64')
url="https://github.com/stlink-org/stlink"
license=('custom')
depends=('libusb>=1.0' 'pkg-config')
makedepends=('cmake' 'git' 'make')
conflicts=('stlink')
provides=('stlink')
install='stlink-git.install'
options=('!makeflags')
source=("${pkgname}"::'git+https://github.com/stlink-org/stlink.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX="/usr/" \
	      -DSTLINK_UDEV_RULES_DIR="/usr/lib/udev/rules.d" \
	      -DSTLINK_MODPROBED_DIR="/usr/lib/modprobe.d"
	make
} 

package() {
	cd "${srcdir}/${pkgname}"

	# install binaries
	make DESTDIR="$pkgdir" install

	# install additional files
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" \
		"README.md" \
		"doc/tutorial.md"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
		"LICENSE.md"
}
