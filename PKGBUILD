# Maintainer: John Maguire <contact@johnmaguire.me>
pkgname=libfxqllauncher
pkgver=0.1.0.6765890
pkgrel=2
pkgdesc="QuakeLive Launcher C++ Library and QML Plugin"
arch=('i686' 'x86_64')
url="https://bitbucket.org/fx_/fx-qllauncher"
license=('GPL3')
depends=('boost>=1.55' 'qt5-base<5.5' 'quazip-qt5' 'qxmpp')
makedepends=('git' 'qt5-declarative')
install="$pkgname.install"
source=("$pkgname::git+https://bitbucket.org/fx_/fx-qllauncher.git")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	# Using 0.1.0 as a stand-in for lack of versioning
	echo 0.1.0.$(git log -1 --format="%h")
}

prepare() {
	cd "$srcdir/$pkgname"

	# Debian quazip-qt5 is Arch quazip5
	sed -i 's/quazip-qt5/quazip5/g' ./fxqllauncher/fxqllauncher.pro

	# Similarly, includes are quazip5, not plain quazip
	find ./ -type f -exec sed -i -e 's/#include <quazip\//#include <quazip5\//g' {} \;
}

build() {
	cd "$srcdir/$pkgname/fxqllauncher"
	qmake fxqllauncher.pro
	make
}

package() {
	cd "$srcdir/$pkgname/fxqllauncher"
	make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
