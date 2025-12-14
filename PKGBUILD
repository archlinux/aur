# Maintainer: Ayla Ounce <ayla@ounce.email>

pkgname=v4l2-relayd
pkgver=0.2.0
pkgrel=1
pkgdesc="Plays gstreamer sources into v4l2loopback devices."
arch=('x86_64')
url="https://gitlab.com/vicamo/v4l2-relayd"
license=('GPL')
depends=(
	'glib2'
       	'gstreamer'
       	'gst-plugins-base-libs'
       	'gst-plugins-good'
       	'v4l2loopback-dkms'
)
makedepends=('git')
source=("https://gitlab.com/vicamo/v4l2-relayd/-/archive/upstream/${pkgver}/v4l2-relayd-upstream-${pkgver}.tar.gz")
sha256sums=('0c063edf18dcc6edcdef46e695128cfc2b2d60964ea8538c7e79a2454310c53d')

build() {
	cd "$srcdir/${pkgname}-upstream-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "$srcdir/${pkgname}-upstream-${pkgver}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}-upstream-${pkgver}"
	make DESTDIR="$pkgdir/" install

	# The module supports configuring multiple loopback devices; since we
	# don't know whether the user might be using some for other purposes,
	# we should not override its options unilaterally.
	rm "$pkgdir/etc/modprobe.d/v4l2-relayd.conf"
	rmdir "$pkgdir/etc/modprobe.d/"
}
