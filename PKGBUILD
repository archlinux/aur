# Maintainer: Anton Leontiev <scileont /at/ gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gst-rtsp-server
pkgver=1.18.5
pkgrel=1
pkgdesc="RTSP server library based on GStreamer"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://gstreamer.freedesktop.org/modules/gst-rtsp-server.html"
license=('LGPL')
makedepends=('meson' 'gobject-introspection')
depends=("gst-plugins-base>=$pkgver" "gst-plugins-bad>=$pkgver")
provides=('libgstrtspserver-1.0.so' 'libgstrtspclientsink.so')
source=("https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f'
            'SKIP')
validpgpkeys=('D637032E45B8C6585B9456565D2EEE6F6F349D7C')
              # Tim-Philipp Müller <tim@centricular.com>

build() {
	arch-meson "$pkgname-$pkgver" build \
		-D doc=disabled \
		-D gobject-cast-checks=disabled \
		-D package-name="GStreamer RTSP Server (Arch Linux)" \
		-D package-origin="https://aur.archlinux.org/"
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm755 build/examples/test-mp4 "$pkgdir/usr/bin/gst-rtsp-mp4"
	install -Dm755 build/examples/test-launch "$pkgdir/usr/bin/gst-rtsp-launch"
	install -Dm755 build/examples/test-netclock "$pkgdir/usr/bin/gst-rtsp-netclock"
	install -Dm755 build/examples/test-netclock-client "$pkgdir/usr/bin/gst-rtsp-netclock-client"
}
