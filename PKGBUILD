# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=libyami
pkgver=1.0.1
pkgrel=1
pkgdesc="Yet Another Media Infrastructure: Intel VA-API Media codecs with hardware acceleration"
arch=('i686' 'x86_64')
url="https://github.com/01org/libyami"
license=('Apache')
depends=('libva')
optdepends=('libva-intel-driver: Hardware Video Acceleration on Intel x86 GPU')
options=('!emptydirs')
changelog=
source=($url/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('1051d3e3366a933c4fbfb883b3900e81a8c0e4e1cd4d5a08b9c7d4e1bf7cec34')

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
