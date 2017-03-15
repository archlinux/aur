# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=simpl-sim
pkgver=2.1.1
pkgrel=1
pkgdesc="SimpLC Simulator for LC-3 assembly language."
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
sha256sums=('51609bcb167010222a86facd2faae9c57e52925a469a20e48651a6aa8dc21cb7'
			'158c6946bdddf6df85e74314099718637da45f5839afd9b9a73dc579b4972e99')

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
	patch --verbose common.h < ../compile-fixes.patch
	sed -i \
		-e "s|^Exec=.*$|Exec=/usr/bin/simpl|" \
		-e "s|^Icon=.*$|Icon=/usr/share/$pkgname/hi16-app-simpl.png|" \
		simpl.desktop

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

	mkdir -p "$pkgdir/usr/share/$pkgname"
	install -m644 'hi16-app-simpl.png' "$pkgdir/usr/share/$pkgname/hi16-app-simpl.png"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 'COPYING' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL"
	install -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set sw=4 ts=4 noet:
