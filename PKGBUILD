# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: _le34n$ <4le34n@gmail.com>

pkgname=nfdump
pkgver=1.6.15
pkgrel=3
pkgdesc="A set of tools to collect and process netflow data."
arch=('i686' 'x86_64')
url="https://github.com/phaag/nfdump/"
license=('BSD')
depends=('glibc')
makedepends=('flex' 'bison' 'rrdtool')
source=("nfdump-v${pkgver}.tar.gz::https://github.com/phaag/nfdump/archive/v${pkgver}.tar.gz")
md5sums=('6f52c01099a2a74e451ebfb17bf92da8')

prepare() {
	cd "$pkgname-$pkgver"

	sed -re 's|-lnfdump|libnfdump.la|g' -i bin/Makefile.am
}

build() {
	cd "$pkgname-$pkgver"

	# Fix error:    "configure.ac:10: error: version mismatch. This is Automake 1.1
	#                configure.ac:10: but the definition used by this AM_INIT_AUTOMA
	#                configure.ac:10: comes from Automake 1.15. You should recreate
	#                configure.ac:10: aclocal.m4 with aclocal and run automake again
	#                WARNING: 'automake-1.15' is probably too old."
	autoreconf

	./configure --prefix=/usr \
	  --enable-nfprofile \
	  --enable-nftrack \
	  --enable-sflow

	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/nfdump/COPYING"
}
