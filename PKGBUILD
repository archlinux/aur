# Maintainer: Maxim Devaev <mdevaev@gmail.com> [Software author]


pkgname=ustreamer
pkgver=6.66
pkgrel=1
pkgdesc="Lightweight and fast MJPEG-HTTP streamer"
url="https://github.com/pikvm/ustreamer"
license=(GPL-3.0-or-later)
arch=(i686 x86_64 armv6h armv7h aarch64)
depends=(libjpeg-turbo libevent libbsd libgpiod systemd)
makedepends=(git)
source=("git+https://github.com/pikvm/ustreamer#commit=v${pkgver}")
sha256sums=('04adb6cdb2bdaefa3cfc1678ed089c5d279ba93f39f6e5666e51f2b2a6f817d9')


_options="WITH_GPIO=1 WITH_SYSTEMD=1"
if [ -e /usr/bin/python3 ]; then
	_options="$_options WITH_PYTHON=1"
	depends+=("python>=3.14" "python<3.15")
	makedepends+=(python-setuptools python-build python-wheel python-installer)
fi
if [ -e /usr/include/janus/plugins/plugin.h ];then
	depends+=(janus-gateway alsa-lib opus)
	makedepends+=(janus-gateway alsa-lib opus)
	_options="$_options WITH_JANUS=1"
fi


build() {
	cd "$srcdir"
	rm -rf $pkgname-build
	cp -r $pkgname $pkgname-build
	cd $pkgname-build
	make $_options CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" $MAKEFLAGS
}

package() {
	cd "$srcdir/$pkgname-build"
	make $_options CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" DESTDIR="$pkgdir" PREFIX=/usr install
}
