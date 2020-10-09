# Maintainer: aksr <aksr at t-com dot me>
pkgname=neix-git
pkgver=0.1.3.r30.g2a770d9
pkgrel=1
pkgdesc="A RSS/Atom feed reader for your terminal."
arch=('i686' 'x86_64')
url="https://github.com/tomschwarz/neix"
license=('GPL3')
depends=('ncurses')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DENABLE-TESTS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_DATAROOTDIR=lib/ .
	make
}

check() {
	cd "$srcdir/$pkgname"
	./bin/tests
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
