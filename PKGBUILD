# Maintainer: Jeremie Nevin <contact@neurovertex.eu>

pkgname=freeling
pkgver=4.0
pkgrel=2
pkgdesc="Natural language analysis libraries"
arch=(any)
url="http://nlp.lsi.upc.edu/freeling"
license=('AGPL')
depends=('boost-libs' 'icu')
makedepends=('make' 'gcc' 'automake' 'autoconf')
optdepends=()
source=($pkgname::git+https://github.com/TALP-UPC/freeling)
md5sums=('SKIP')

pkgrel() {
	git log -1 --date=short | grep Date | cut -d" " -f4 | tr -d "-"
}

prepare() {
	cd "$srcdir/$pkgname"
	autoreconf --install
	./configure --prefix="$pkgdir/usr"
#	./configure --prefix="$pkgdir/usr" --enable-traces --enable-debug
}

build() {
	cd "$srcdir/$pkgname/"
	make
}

package() {
	cd "$srcdir/$pkgname/"
	make INSTALL_ROOT=$pkgdir install
	cd "$pkgdir/usr/bin"
	# Prevent conflict with Hunspell
	echo "Note that to prevent conflict with hunspell on /bin/analyze,"\
		" FL's analyze executable is renamed to 'fl_analyze'"
	mv "analyze" "fl_analyze"
}
