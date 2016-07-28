# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=libyami
pkgver=0.4.0
pkgrel=1
pkgdesc="Yet Another Media Infrastructure: Media codec with hardware acceleration"
arch=(i686 x86_64)
url="https://github.com/01org/libyami"
license=('Apache')
depends=(libva)
options=(!emptydirs)
changelog=
source=($url/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('b4a139fac81b6644828e8c9c377fe251128d2b4440ffd656f973c0bee14a2821')

build() {
	export LD_RUN_PATH='$ORIGIN/lib/'
	cd $pkgname-$pkgname-$pkgver
	sh autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    	--with-package-name="Libyami Media Infrastructure (Arch Linux)" \
    	--with-package-origin="http://www.archlinux.org/" \
	--enable-h265dec \
	--enable-vc1dec \
	--enable-h264dec \
	--enable-jpegdec \
	--enable-mpeg2dec \
	--enable-vp8dec \
	--enable-vp9dec \
	--enable-h265enc \
	--enable-h264enc \
	--enable-jpegenc \
	--enable-vp8enc
	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
	unset LD_RUN_PATH
}

check() {
	cd "$pkgname-$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
