# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=('textadept' 'textadept-gtk3' 'textadept-curses')
pkgver=11.4
pkgrel=3
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/orbitalquark/textadept"
license=('MIT')
makedepends=('gtk2' 'gtk3' 'ncurses' 'wget' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgname}_$pkgver.tar.gz")
sha256sums=('fe10cbe9949e3a2ec4445ace16e26eb4b905cee2e36de76295ea9a7ca6c3aba8')

prepare() {
	cd "$pkgbase-${pkgbase}_${pkgver}"
	( cd src
	make deps
	## thanks lacsaP
	sed -i '1008s/volatile//;1099s/volatile//;' scintilla/gtk/ScintillaGTKAccessible.cxx
	## makes compile flags work again
	sed -i \
		-e 's/CFLAGS :=/CFLAGS +=/g' \
		-e 's/CXXFLAGS :=/CXXFLAGS +=/g' \
		-e 's/LDFLAGS :=/LDFLAGS +=/g' \
		Makefile )
	cp -a src src-curses
	cp -a src src-gtk3
}

build() {
	cd "$pkgbase-${pkgbase}_${pkgver}"
	(cd src; make GTK2=1)
	(cd src-gtk3; make GTK3=1)
	(cd src-curses; make curses)
}

package_textadept() {
	depends=('gtk2')
	provides=('textadept-curses')
	conflicts=('textadept-curses')

	cd "$pkgbase-${pkgbase}_${pkgver}/src"
	make GTK2=1 PREFIX=/usr DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
	make curses PREFIX=/usr DESTDIR="$pkgdir" install

	# License
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "/usr/share/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -d "$pkgdir/usr/share/doc"
	ln -sv "/usr/share/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
}

package_textadept-gtk3() {
	depends=('gtk3')
	provides=("$pkgbase" 'textadept-curses')
	conflicts=("$pkgbase" 'textadept-curses')

	cd "$pkgbase-${pkgbase}_${pkgver}/src-gtk3"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/share/pixmaps/"textadept{.svg,.png}
	make curses PREFIX=/usr DESTDIR="$pkgdir" install

	# License
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "/usr/share/$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -dv "$pkgdir/usr/share/doc"
	ln -sv "/usr/share/$pkgbase/docs" "$pkgdir/usr/share/doc/$pkgname"
}

package_textadept-curses() {
	depends=('ncurses')

	cd "$pkgbase-${pkgbase}_${pkgver}/src-curses"
	make curses PREFIX=/usr DESTDIR="$pkgdir" install

	# License
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "/usr/share/$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

	# Documentation
	install -dv "$pkgdir/usr/share/doc"
	ln -sv "/usr/share/$pkgbase/docs" "$pkgdir/usr/share/doc/$pkgname"
}
