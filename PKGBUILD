# Maintainer: aksr <aksr at t-com dot me>
pkgname=es-shell-git
pkgver=0.9.2.r47.gf879b9e
pkgrel=1
pkgdesc='A extensible shell with higher-order functions, derived from the Plan 9 shell, rc.'
arch=('i686' 'x86_64')
url='https://github.com/wryun/es-shell'
license=('Public Domain')
makedepends=('git')
optdepends=('termcap: for mksignal')
install=${pkgname%-*-*}.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	libtoolize -qi
	autoreconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make prefix="$pkgdir/usr" install
	mkdir -p $pkgdir/usr/share/doc/${pkgname%-*}/
	install -m644 README.md initial.es mksignal esdebug \
	  doc/usenix-w93.ps doc/ERRATA doc/TODO "$pkgdir/usr/share/doc/${pkgname%-*}"
	cp -r examples "$pkgdir/usr/share/doc/${pkgname%-*}/"
}
