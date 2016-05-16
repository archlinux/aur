# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=stlink-git
pkgrel=1
pkgver=r821.9cf48a7
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
	./configure --prefix="/usr/" --with-gtk
	make
} 

package() {
	cd "${srcdir}/${pkgname}"

	# install binaries
	make DESTDIR="$pkgdir" install

	# install additional files
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" \
		"README" \
		"README.md" \
		"ACKNOWLEDGMENTS" \
		"AUTHORS" \
		"ChangeLog" \
		"NEWS" \
		"doc/tutorial.md"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
		"COPYING" \
		"LICENSE"
	install -Dm644 -t "${pkgdir}/etc/modprobe.d/" \
		etc/modprobe.d/*
	install -Dm644 -t "${pkgdir}/etc/udev/rules.d/" \
		etc/udev/rules.d/*
}
