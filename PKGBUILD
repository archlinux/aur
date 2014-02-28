# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=usbmuxd-git
epoch=1
pkgver=1.0.8.63.g5927823
pkgrel=1
pkgdesc="USB Multiplex Daemon"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'libxml2' 'libusbmuxd-git')
makedepends=('git' 'cmake')
provides=('usbmuxd')
conflicts=('usbmuxd')
install='usbmuxd.install'

source=("git://git.sukimashita.com/usbmuxd.git"
        'usbmuxd.service'
        '39-usbmuxd.rules')
sha512sums=('SKIP'
            '9771b422e9b48e11a0c2ecaafda06ea9acee651afd4f7e7589e9704d60bd9eb014f6b737d1e279735225f68d910183c698949ee153275e0873940dae00911210'
            'aa5e9f6caf8978ff458d789e549ab931d41d4443ae7802eca27b736db812d12938d2a23999d15d7fcbe4ec993495cd1bc88f2c40c3e44710e575e792669179cd')

pkgver() {
	cd usbmuxd

	git describe --long | sed -r -e 's|^v||' -e 's|-|.|g'
}

build() {
	cd usbmuxd

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd usbmuxd
	make DESTDIR="${pkgdir}" install
	
	# fix for /lib -> /usr/lib move
	mkdir -p "${pkgdir}/usr/lib"
	mv "${pkgdir}/lib"/* "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/lib"

	# fix for bindir -> /usr/bin move
	mkdir -p "${pkgdir}/usr/bin"
	mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
	rm -rf "${pkgdir}/usr/sbin"

	# install systemd service file
	install -Dm644 "${srcdir}/usbmuxd.service" "${pkgdir}/usr/lib/systemd/system/usbmuxd.service"

	# use udev rule that works with systemd
	install -Dm644 "${srcdir}/39-usbmuxd.rules" "${pkgdir}/usr/lib/udev/rules.d/39-usbmuxd.rules"
}

# vim:set ts=2 sw=2:
