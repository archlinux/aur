# Maintainer: Jack L. Frost <fbt@fleshless.org>
# % Trigger: 1434722047 %
# vim: ft=sh

pkgdesc="Standalone systemd libs (including -compat)"
pkgname=( 'libsystemd-standalone' 'libsystemd-udev' )
pkgver=230
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam' 'python' 'python-lxml' 'quota-tools' 'xz')
options=('strip')
source=( "https://github.com/systemd/systemd/archive/v${pkgver}.tar.gz" )

build() {
  cd "systemd-$pkgver"

  ./autogen.sh
  ./configure

  make
}

package_libsystemd-standalone() {
	install='libsystemd.install'
	provides=( 'libsystemd.so' 'libsystemd' )

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

package_libsystemd-udev() {
	_libudev_version='1.6.4'
	install='libsystemd.install'
	provides=( 'libudev.so' 'libudev' )

	install -Dm644 "systemd-$pkgver/.libs/libudev.la" "${pkgdir}/usr/lib/libudev.la"
	install -Dm644 "systemd-$pkgver/.libs/libudev.so.$_libudev_version" "${pkgdir}/usr/lib/libudev.so.$_libudev_version"
		ln -s "libudev.so.$_libudev_version" "$pkgdir/usr/lib/libudev.so.1"
		ln -s "libudev.so.$_libudev_version" "$pkgdir/usr/lib/libudev.so"

	install -Dm644 "systemd-$pkgver/src/libudev/libudev.pc" "$pkgdir/usr/lib/pkgconfig/libudev.pc"
	install -Dm644 "systemd-$pkgver/src/libudev/libudev.h" "$pkgdir/usr/include/libudev.h"
}

sha1sums=('2196493295e96527e0c1ee960e3d17e1d2165e9f')
