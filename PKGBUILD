# Maintainer: Christian Mauderer <c_mauderer[at]yahoo[dot]de>
pkgname=stlink-git
pkgrel=7
pkgver=r553.c84d8fa
pkgdesc="stm32 discovery line linux programmer."
arch=('i686' 'x86_64')
url="https://github.com/texane/stlink"
license=('custom')
depends=('libusb>=1.0' 'pkg-config')
makedepends=('git' 'autoconf' 'automake')
conflicts=('stlink')
provides=('stlink')
install='stlink-git.install'
options=('!makeflags')
source=("${pkgname}"::'git+https://github.com/texane/stlink.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	./autogen.sh
	./configure --prefix="/usr/"
	make
} 

package() {
	cd "${srcdir}/${pkgname}"

	# install binaries
	make DESTDIR="$pkgdir" install

	# install additional files
	install -Dm644 "stlink_v1.modprobe.conf"   "${pkgdir}/etc/modprobe.d/stlink_v1.modprobe.conf"
	install -Dm644 "49-stlinkv1.rules"         "${pkgdir}/etc/udev/rules.d/49-stlinkv1.rules"
	install -Dm644 "49-stlinkv2.rules"         "${pkgdir}/etc/udev/rules.d/49-stlinkv2.rules"
	install -Dm644 "LICENSE"                   "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm644 "README"                    "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm644 "ACKNOWLEDGMENTS"           "${pkgdir}/usr/share/doc/${pkgname}/ACKNOWLEDGMENTS"
	install -Dm644 "AUTHORS"                   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
	install -Dm644 "doc/tutorial/tutorial.pdf" "${pkgdir}/usr/share/doc/${pkgname}/tutorial.pdf"
}
