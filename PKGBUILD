# Maintainer: aksr <aksr at t-com dot me>
pkgname=qed-git
pkgver=r155.0697882
pkgrel=1
pkgdesc="A port of Rob Pike's version of the QED editor for Unix, supporting UTF8-encoded Unicode."
arch=('i686' 'x86_64')
url="https://github.com/phonologus/QED"
license=('unknown')
makedepends=('git' 'go-md2man')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname/doc"
	go-md2man -in qed-tutorial.md -out qed-tutorial.1
	sed -i 's!\(qed-tutorial\.\)html!\11!' ../Makefile
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALLD="$pkgdir/usr" install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	cp --no-preserve=mode -r q doc/historical $pkgdir/usr/share/doc/${pkgname%-*}
}
