# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=libyami-utils
pkgver=1.3.0
pkgrel=2
pkgdesc="Intel VA-API Media Applications and Scripts for libyami"
arch=('i686' 'x86_64')
url="https://github.com/01org/libyami-utils"
license=('Apache')
depends=('libbsd' 'libyami' 'ffmpeg')
options=('!emptydirs')
changelog=
source=($url/archive/libyami-$pkgver.tar.gz)
sha256sums=('0b5cebeb677d3a6b162347017fcb2d42405a66d30c194dd26a80827a4d6b22cc')

build() {
	export LD_RUN_PATH='$ORIGIN/lib/'
	cd $pkgname-libyami-$pkgver
	sh autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    	--with-package-name="Libyami Media Utils (Arch Linux)" \
    	--with-package-origin="http://www.archlinux.org/" \
	--enable-avformat
	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
	unset LD_RUN_PATH
}

check() {
	cd "$pkgname-libyami-$pkgver"
	make check
}

package() {
	cd "$pkgname-libyami-$pkgver"
	make DESTDIR="$pkgdir/" install
}
