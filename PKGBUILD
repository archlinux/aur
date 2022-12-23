# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse-git
pkgver=3.8.5.r189.g9a6c8a74
pkgrel=1
pkgdesc="A line-oriented editor, browser and mail client."
arch=('i686' 'x86_64')
url="http://edbrowse.org/"
license=('GPL' 'openssl')
depends=('openssl' 'pcre' 'curl>=7.29.0' 'unixodbc' 'quickjs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/CMB/edbrowse")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname/src"
	sed -i 's!quickjs-libc.h!quickjs/&!' jseng-quick.c js_hello_quick.c
}

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	QUICKJS_DIR="/usr/lib/quickjs/" make
}

package() {
	cd "$srcdir/$pkgname/src"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 ../doc/man-edbrowse-debian.1 $pkgdir/usr/share/man/man1/edbrowse.1
	install -Dm644 ../doc/sample.ebrc ../README $pkgdir/usr/share/doc/${pkgname%-*}
	install -Dm644 ../COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}
