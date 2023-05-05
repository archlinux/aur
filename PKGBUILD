# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contriburor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=usbmuxd-git
epoch=1
pkgver=1.1.1.r47.g049877e
pkgrel=1
pkgdesc="A socket daemon to multiplex connections from and to iOS devices"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('libimobiledevice-git' 'libusb' 'libplist-git' 'libimobiledevice-glue-git')
makedepends=('git' 'systemd')
provides=("usbmuxd=$pkgver")
conflicts=('usbmuxd')
source=("git+https://github.com/libimobiledevice/usbmuxd"
        usbmuxd.sysusers)
sha256sums=('SKIP'
            '044bfb2810b27f7d6c066f142210775176b7484e76a78ea91794f40fdcda6fd9')

pkgver() {
	cd usbmuxd
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd usbmuxd
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd usbmuxd
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
	#sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # not needed anymore (libtool honors $LDFLAGS now)
	make
}

check() {
	cd usbmuxd
	make check
}

package() {
	cd usbmuxd
	make DESTDIR="${pkgdir}" install

	install -Dm644 "$srcdir"/usbmuxd.sysusers "$pkgdir"/usr/lib/sysusers.d/usbmuxd.conf
}
