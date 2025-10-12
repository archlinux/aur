# Maintainer: aksr <aksr at t-com dot me>
pkgname=sciteco-git
pkgver=r1430.f223cfa
pkgrel=1
pkgdesc='Advanced TECO dialect and interactive screen editor based on Scintilla'
arch=('i686' 'x86_64')
url='https://github.com/rhaberkorn/sciteco'
license=('GPL3')
makedepends=('git' 'groff')
depends=('ncurses')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+git://git.fmsbw.de/sciteco")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init
	autoreconf -iv
}

build() {
	cd "$srcdir/$pkgname"
	export CFLAGS="$CFLAGS -O3 -flto"
	export CXXFLAGS="$CXXFLAGS -O3 -flto"
	export LDFLAGS="$LDFLAGS -flto"
	./configure --prefix=/usr \
	            --with-scitecodatadir=/usr/share/sciteco
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
