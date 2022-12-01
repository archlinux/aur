# Maintainer: Emmie Maeda <emmie.maeda@gmail.com>

pkgname=simpl-sim
pkgver=2.1.1
pkgrel=2
pkgdesc='SimpLC Simulator for LC-3 assembly language.'
arch=('any')
url='https://sourceforge.net/projects/simplc/files/?source=navbar'
license=('GPL' 'BSD')
depends=('readline' 'ncurses' 'qt3')
makedepends=('gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=('http://tenet.dl.sourceforge.net/project/simplc/simplc-src/2.1.1b2/simp2.1.1b2.tar.gz'
		'compile-fixes.patch')
sha512sums=('faac1f3da89d3b0da097741ee89fb363f99ccc35d869b219276b84f31430df64cb7d8417cc7d9e5a1d5f72ce50fdfac66333ae0c8f44edff67f536fe0fd9dec8'
			'3d8d3cf6bbcc2dde9eea6741ba5a694cd56013078cd1c23b4c9b4130551ea09e54a08d8acb82b56457489c94860a3fc3ee545e8c0e29468267b4c4f17dcc4b8e')

build() {
	cd "$srcdir/simpl-src"

	msg 'Creating configuration...'
	cat > .options <<- EOF
	READLINE="-lreadline"
	CURSES="-lncurses"
	EXCEPTIONS="-fno-exceptions"
	INSTALL="y"
	DEST="$pkgdir/usr/lib/$pkgname"
	BINDIR="$pkgdir/usr/bin"
	QTLIB=""
	QTLIBDIR=""
	QTINC=""
	QTINCDIR=""
	KDELIB=""
	KDELIBDIR=""
	KDEINC=""
	KDEINCDIR=""
	MOC="/usr/bin/moc-qt3"
	USE_KDE=""
	EOF
	./config.sh

	msg 'Applying patches...'
	patch common.h < ../compile-fixes.patch

	# Fix desktop file paths
	sed -i \
		-e 's|^Exec=.*$|Exec=/usr/bin/simpl|' \
		-e 's|^Icon=.*$|Icon=/usr/share/pixmaps/hi16-app-simpl.png|' \
		simpl.desktop

	# Ignore QT header warnings
	sed -i \
		-e 's|-Wconversion|-Wno-conversion|g' \
		build/buildvar.sh

	msg 'Compiling...'
	make
}

package() {
	cd "$srcdir/simpl-src"

	mkdir -p "$pkgdir/usr/bin"
	install -m755 'gt16as' "$pkgdir/usr/bin/gt16as"
	install -m755 'gt16qt' "$pkgdir/usr/bin/gt16qt"
	install -m755 'gt16text' "$pkgdir/usr/bin/gt16text"
	install -m755 'lc3as' "$pkgdir/usr/bin/lc3as"
	install -m755 'simp' "$pkgdir/usr/bin/simp"
	install -m755 'simpl' "$pkgdir/usr/bin/simpl"

	mkdir -p "$pkgdir/usr/share/applications"
	install -m644 'simpl.desktop' "$pkgdir/usr/share/applications/simpl.desktop"

	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -m644 'hi16-app-simpl.png' "$pkgdir/usr/share/pixmaps/hi16-app-simpl.png"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 'COPYING' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL"
	install -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set sw=4 ts=4 noet:
