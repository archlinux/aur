# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>
# Keywords: TCL Tk 2D canvas SVG anti-aliasing

pkgname=tkpath-fossil
pkgver=0.3.3
pkgrel=2
pkgdesc='2D drawing widget for the Tk GUI toolkit'
arch=('x86_64')
url='http://chiselapp.com/user/rene/repository/tkpath'
license=('BSD')
depends=('cairo' 'tk' 'libx11')
makedepends=('fossil' 'md4c')
provides=("tkpath=$pkgver")
source=("fossil+$url")
md5sums=('SKIP')

pkgver() {
	sed -nr 's/#define\s+TKPATH_PATCHLEVEL\s+"(.+)"/\1/p' "$srcdir/tkpath/generic/path.c"
}

prepare() {
	cd "$srcdir/tkpath"
	ln -sf /usr/include/tk-private/generic/default.h    generic/
	ln -sf /usr/include/tk-private/unix/tkUnixDefault.h generic/
	sh ./configure --prefix=/usr
}

build() {
	cd "$srcdir/tkpath"
	make all
	md2html -f -o doc/tkpath.html doc/tkpath.n.md
}

package() {
	cd "$srcdir/tkpath"
	make PKG_DIR="tkpath-$pkgver" DESTDIR="$pkgdir" install
	rmdir                                 "$pkgdir"/usr/{bin,include}
	install -d                            "$pkgdir"/usr/share/tkpath-"$pkgver"/demos
	install -m644  demos/*                "$pkgdir"/usr/share/tkpath-"$pkgver"/demos
	install -Dm644 doc/tkpath.html        "$pkgdir"/usr/share/doc/tkpath-"$pkgver"/tkpath.html
}
