# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.82
pkgrel=1
pkgdesc="Copy-on-write wrapper for pbuilder"
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/cowdancer"
license=('GPL')
depends=('pbuilder-ubuntu'
         'ncurses'
	 'ncurses5-compat-libs')
optdepends=('qemu: if you want to use qemubuilder'
            'bash-completion: bash autocomplete support')

source=(http://httpredir.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.tar.xz)
sha256sums=('79614c398007b2934217a9547902b01c35d89cbf2639a518b6587d36c8c41cd3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# cow-shell fails to compile if linker is called with '--as-needed'
	# therefore we strip that flag from LDFLAGS from makepkg.conf
	export LDFLAGS=$(echo $LDFLAGS | sed 's/,--as-needed//g')
	autoreconf --install
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	
}
