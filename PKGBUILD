# $Id$
# Maintainer: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

# Modified for raspberry pi by Grey Christoforo <first name [at] last name [dot] net>

pkgname=weston-rbp
pkgver=1.9.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor for rbp'
arch=('armv7h' 'armv6h')
conflicts=('weston')
provides=('weston')
replaces=('weston')
url='http://wayland.freedesktop.org'
license=('MIT')
depends=('libxkbcommon' 'libinput' 'libunwind' 'poppler-glib' 'mtdev' 'libxcursor' 'glu' 'pango' 'colord')
source=("http://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz")
sha1sums=('94b70baca9a6ba007c696b740a711586f9dc274f')

build() {
	cd weston-$pkgver
	export RPI_BCM_HOST_LIBS="-L/opt/vc/lib"
	export RPI_BCM_HOST_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
	export WESTON_NATIVE_BACKEND="rpi-backend.so"
	export RPI_COMPOSITOR_LIBS="-ludev -lmtdev -lbcm_host"
	CONFIG='--disable-egl'
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--enable-libinput-backend \
		--enable-demo-clients-install $CONFIG
	make
}

package() {
	cd weston-$pkgver
	make DESTDIR="$pkgdir" install
	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/weston/COPYING"
}
