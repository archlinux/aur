# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=libyami
pkgver=1.3.2
pkgrel=6
pkgdesc="Yet Another Media Infrastructure: Intel VA-API Media codecs with hardware acceleration"
arch=('i686' 'x86_64')
url="https://github.com/01org/libyami"
license=('Apache')
depends=('libva')
optdepends=('libva-intel-driver: Hardware Video Acceleration on Intel x86 GPU')
options=('!emptydirs')
changelog=
source=($url/archive/$pkgver.tar.gz)
sha256sums=('d6b741d49aebeba736162d7ee092ffb3e19ebdf3e1b9bdbec1f9d5599757d2cb')

build() {
        export CXXFLAGS="-Wno-error"
	export LD_RUN_PATH='$ORIGIN/lib/'
	cd $pkgname-$pkgver
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
	--enable-vp8dec \
	--enable-vp9enc
	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
	unset LD_RUN_PATH
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
