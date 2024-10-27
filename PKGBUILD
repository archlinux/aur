# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse-git
pkgver=3.8.10.r15.g1c6e8631
pkgrel=1
pkgdesc='A line-oriented editor, browser and mail client.'
arch=('i686' 'x86_64')
url='http://edbrowse.org/'
license=('GPL' 'openssl')
depends=('openssl' 'pcre' 'curl>=7.29.0' 'unixodbc' 'quickjs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/CMB/edbrowse")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	make QUICKJS_INCLUDE=/usr/include/quickjs QUICKJS_LIB=/usr/lib/quickjs
}

package() {
	cd "$srcdir/$pkgname/src"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -D -m644 ../doc/man-edbrowse-debian.1 $pkgdir/usr/share/man/man1/edbrowse.1
	install -D -m644 ../doc/sample.ebrc ../README $pkgdir/usr/share/doc/${pkgname%-*}
	install -D -m644 ../COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}
