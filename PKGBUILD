# $Id$
# Maintainer: Sean V Kelley <seanvk@posteo.de>

pkgname=clr-power-tweaks
pkgver=208
pkgrel=2
pkgdesc="Power Tweaks -- adjusts runtime kernel options for optimal power and performance"
arch=('i686' 'x86_64')
url="https://github.com/clearlinux/clr-power-tweaks"
license=('GPL3')
depends=('glibc')
options=('!emptydirs')
changelog=
source=($url/archive/$pkgname-$pkgver.tar.gz 'verify_time.patch')
sha256sums=('72660594d400dc13259743d400c674032bbb0199925580dc608fd12fa2bc0225'
  '974619b5700f33d36f297dce522d913f20929e00eb14821f95b7dff21f6efd42')

prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=2 --input="${srcdir}/verify_time.patch"
}
build() {
	export LD_RUN_PATH='$ORIGIN/lib/'
	cd $pkgname-$pkgver
	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    	--with-package-name="Clear Power Tweaks (Arch Linux)" \
    	--with-package-origin="http://www.archlinux.org/"
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
