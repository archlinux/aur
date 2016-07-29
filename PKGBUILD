# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=libyami-utils
pkgver=0.1.0
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for libyami"
arch=('i686' 'x86_64')
url="https://github.com/01org/libyami-utils"
license=('Apache')
depends=('libbsd' 'libyami' 'ffmpeg')
options=('!emptydirs')
changelog=
#source=($url/archive/$pkgver.tar.gz -> $pkgname-$pkgver.tar.gz)
source=($url/archive/$pkgver.tar.gz)
sha256sums=('45de376a3f744f01c720ab0f0f33efde6dee75fcdfb8c1c1bdd434673ac1c565')

build() {
	export LD_RUN_PATH='$ORIGIN/lib/'
	cd $pkgname-$pkgver
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
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
