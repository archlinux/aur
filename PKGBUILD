# Maintainer: Zoltán Nyikos <nyikoszoltan0@gmail.com>
# vim: ft=sh

pkgdesc="Standalone systemd libs (for eudev)"
pkgname='libsystemd-eudev-standalone'
pkgver=232
pkgrel=2
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
sha256sums=('1172c7c7d5d72fbded53186e7599d5272231f04cc8b72f9a0fb2c5c20dfc4880')

build() {
  cd "systemd-$pkgver"

  ./autogen.sh
  ./configure

  make
}

package() {

	make -C "systemd-$pkgver" DESTDIR="$pkgdir" install-rootlibLTLIBRARIES

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

	cd "$pkgdir/usr/lib"
	rm libudev.so* libudev.la
}
