# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.81
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
sha256sums=('0a9f344f4271a8e4eef7a087ac6a28a8741b9b78e73669626373b7b729776ad4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# cow-shell fails to compile if linker is called with '--as-needed'
	# therefore we strip that flag from LDFLAGS from makepkg.conf
	export LDFLAGS=$(echo $LDFLAGS | sed 's/,--as-needed//g')
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	ln -sr $pkgdir/usr/bin $pkgdir/usr/sbin
	make DESTDIR="$pkgdir" install
	rm $pkgdir/usr/sbin
	
}
