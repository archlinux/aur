# Maintainer: Jack L. Frost <fbt@fleshless.org>
# vim: ft=sh

pkgdesc="Standalone systemd libs (for eudev)"
pkgname='libsystemd-eudev-standalone'
pkgver=231
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
install='libsystemd.install'
provides=( 'libsystemd.so' 'libsystemd' )
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam' 'python' 'python-lxml' 'quota-tools' 'xz')
options=('strip')
source=( "https://github.com/systemd/systemd/archive/v${pkgver}.tar.gz" )
sha1sums=('47768103290d2023c3452bc36bc77f7b1fd798ea')

build() {
  cd "systemd-$pkgver"

  ./autogen.sh
  ./configure

  make
}

package() {

	make -C "systemd-$pkgver" DESTDIR="$pkgdir" install-libLTLIBRARIES

	# Headers
	cd "systemd-$pkgver"
	install -Dm644 src/systemd/_sd-common.h "${pkgdir}/usr/include/systemd/_sd-common.h"
	install -Dm644 src/systemd/sd-messages.h "${pkgdir}/usr/include/systemd/sd-messages.h"
	install -Dm644 src/systemd/sd-event.h "${pkgdir}/usr/include/systemd/sd-event.h"
	install -Dm644 src/systemd/sd-bus.h "${pkgdir}/usr/include/systemd/sd-bus.h"
	install -Dm644 src/systemd/sd-bus-protocol.h "${pkgdir}/usr/include/systemd/sd-bus-protocol.h"
	install -Dm644 src/systemd/sd-bus-vtable.h "${pkgdir}/usr/include/systemd/sd-bus-vtable.h"
	install -Dm644 src/systemd/sd-daemon.h "${pkgdir}/usr/include/systemd/sd-daemon.h"
	install -Dm644 src/systemd/sd-id128.h "${pkgdir}/usr/include/systemd/sd-id128.h"
	install -Dm644 src/systemd/sd-journal.h "${pkgdir}/usr/include/systemd/sd-journal.h"
	install -Dm644 src/systemd/sd-login.h "${pkgdir}/usr/include/systemd/sd-login.h"

	# pkg-config
	install -Dm644 src/libsystemd/libsystemd.pc "${pkgdir}/usr/lib/pkgconfig/libsystemd.pc"

	# remove libudev stuff
	cd "$pkgdir/usr/lib"
	rm libudev.so* libudev.la
}

