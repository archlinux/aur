# Maintainer: Maxim Mikityanskiy <maxtram95@gmail.com>

_pkgname=mindforger
pkgname=$_pkgname-src
pkgver=1.50.0
pkgrel=1
pkgdesc="Thinking notebook and Markdown IDE. Search, browse, view and edit your Markdown files. Get as much as possible from knowledge in your remarks. (Build from source.)"
arch=('any')
url="https://github.com/dvorka/mindforger"
license=('GPL-2.0')
depends=('hicolor-icon-theme' 'qt5-base' 'qt5-svg' 'qt5-webkit' 'zlib')
optdepends=('dropbox: Dropbox syncing')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/dvorka/$_pkgname.git#tag=$pkgver"
	"$_pkgname-repository::git+https://github.com/dvorka/$_pkgname-repository.git#commit=a17ada7"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_pkgname"

	mkdir -p deps/cmark-gfm/build
	cd deps/cmark-gfm/build
	cmake -DCMARK_TESTS=OFF -DCMARK_SHARED=OFF ..
	cmake --build .
	cd -

	cd deps/discount
	./configure.sh
	make
	cd -

	qmake-qt5 -r CONFIG+=mfnoccache mindforger.pro
	make V=1 VERBOSE=1
}

package() {
	cd "$srcdir/$_pkgname"
	make INSTALL_ROOT="$pkgdir" install

	# No need to install a package-specific static lib.
	rm "$pkgdir/usr/lib/libdiscount.a"

	cd "$srcdir/$_pkgname-repository"
	mkdir -p "$pkgdir/usr/share/doc/mindforger/"
	# Copy visible files only (excludes .git).
	cp -dr * "$pkgdir/usr/share/doc/mindforger/"
}
