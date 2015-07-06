# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=usbmuxd-git
epoch=1
pkgver=1.1.0.r18.g423fb8c
pkgrel=2
pkgdesc="USB Multiplex Daemon"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libusb' 'libplist-git' 'libimobiledevice-git')
makedepends=('git' 'cmake')
provides=('usbmuxd')
conflicts=('usbmuxd')
install='usbmuxd.install'

source=("git://git.sukimashita.com/usbmuxd.git"
        'usbmuxd.service'
        '39-usbmuxd.rules')
sha512sums=('SKIP'
            '9771b422e9b48e11a0c2ecaafda06ea9acee651afd4f7e7589e9704d60bd9eb014f6b737d1e279735225f68d910183c698949ee153275e0873940dae00911210'
            'dc5af2442584e51ddd5828dc7f0d9d670da7026eedf1a3694f59a07741bd9280b90932c73b6ee8e95b993304c4ca3b787119f23125a232fbc5527c44dde64641')

pkgver() {
	cd usbmuxd

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd usbmuxd

	./autogen.sh --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd usbmuxd
	make DESTDIR="${pkgdir}" install

	# install systemd service file
	install -Dm644 "${srcdir}/usbmuxd.service" "${pkgdir}/usr/lib/systemd/system/usbmuxd.service"

	# use udev rule that works with systemd
	install -Dm644 "${srcdir}/39-usbmuxd.rules" "${pkgdir}/usr/lib/udev/rules.d/39-usbmuxd.rules"
}

# vim:set ts=2 sw=2:
