# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.86
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
sha256sums=('7a2bd85025bc585543e189aa5f48f4088d30c89885d9d9576295f9a844ee6bf7')

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
