# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=libva-utils
pkgver=1.8.1
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for libva"
arch=('i686' 'x86_64')
url="https://github.com/01org/libva-utils"
license=('MIT')
depends=('libva' 'libdrm' 'libxfixes')
makedepends=('mesa')
optdepends=('libva-intel-driver: backend for Intel cards')
options=('!emptydirs')
changelog=
source=($url/archive/$pkgver.tar.gz)
sha256sums=('cbd7a88b9b2592106879d271008c9e2236457e5bf4a647efe4bb3d3eaabaf94c')

build() {
	export LD_RUN_PATH='$ORIGIN/lib/'
	cd $pkgname-$pkgver
	sh autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    	--with-package-name="Libva Media Utils (Arch Linux)" \
    	--with-package-origin="http://www.archlinux.org/" \
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
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
