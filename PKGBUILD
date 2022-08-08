# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=('textadept' 'textadept-gtk3' 'textadept-curses')
pkgver=11.4
pkgrel=2
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/orbitalquark/textadept"
license=('MIT')
makedepends=('gtk2' 'gtk3' 'ncurses' 'wget' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgname}_$pkgver.tar.gz")
sha256sums=('f23deb6e178c0eab2d91f5f43d74945aa7d7e90ceb5cc043fc900f9e61562383')

prepare() {
	cd "textadept-textadept_$pkgver/src"
	make deps
	## thanks lacsaP
	sed -i '1008s/volatile//;1099s/volatile//;' scintilla/gtk/ScintillaGTKAccessible.cxx
	## makes compile flags work again
	sed -i \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/CXXFLAGS =/CXXFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		Makefile
}

package_textadept() {
	depends=('gtk2')
	provides=('textadept-curses')
	conflicts=('textadept-curses')

	cd "textadept-textadept_${pkgver}/src"
	if [[ -f ../textadept ]]; then
		make clean
	fi
	make GTK2=1
	make curses
	make GTK2=1 PREFIX=/usr DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
	make curses PREFIX=/usr DESTDIR="$pkgdir" install

	# License
	install -Dm644 "$pkgdir/usr/share/textadept/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -d "$pkgdir/usr/share/doc"
	ln -s /usr/share/textadept/docs "$pkgdir/usr/share/doc/$pkgname"
}

package_textadept-gtk3() {
	depends=('gtk3')
	provides=("$pkgbase" 'textadept-curses')
	conflicts=("$pkgbase" 'textadept-curses')

	cd "textadept-textadept_${pkgver}/src"
	if [[ -f ../textadept ]]; then
		make clean
	fi
	make
	make curses
	make PREFIX=/usr DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
	make curses PREFIX=/usr DESTDIR="$pkgdir" install

	# License
	install -Dm644 "$pkgdir/usr/share/textadept/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -d "$pkgdir/usr/share/doc"
	ln -s /usr/share/textadept/docs "$pkgdir/usr/share/doc/$pkgname"
}

package_textadept-curses() {
	depends=('ncurses')

	cd "textadept-textadept_${pkgver}/src"
	if [[ -f ../textadept ]]; then
		make clean
	fi
	make curses
	make curses PREFIX=/usr DESTDIR="$pkgdir" install

	# License
	install -Dm644 "$pkgdir/usr/share/textadept/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -d "$pkgdir/usr/share/doc"
	ln -s /usr/share/textadept/docs "$pkgdir/usr/share/doc/$pkgname"
}
