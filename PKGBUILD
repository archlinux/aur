# Maintainer: aksr <aksr at t-com dot me>
pkgname=spitbol-git
pkgver=4.0d.r1381.76b7ada
pkgrel=1
pkgdesc='An extremely high performance implementation of the SNOBOL4 language that brings raw power and speed to non-numeric computation.'
url='https://github.com/spitbol/x64'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'nasm')
source=("$pkgname::git+$url" 'git+https://github.com/spitbol/spitbol-docs')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" \
	"$(git describe --tags | sed 's/^[Vv]//;s/-.*//')" \
	"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make clean
	make bootsbl
	make BASEBOL=./bootsbl spitbol
	make bininst
}

#check() {
#	cd "$srcdir/${pkgname}"
#	./sanity-check
#	cd "$srcdir/${pkgname}/test"
#	math_tests.sh
#}

package() {
	cd "$srcdir/${pkgname}"
	sed -i 's/sudo//g' Makefile
	make destprefix="$pkgdir/usr" \
	     DEMODEST="$pkgdir/usr/share/doc/${pkgname%-*}/demos" \
	     MANDEST="$pkgdir/usr/share/man/man1" install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	cd "$srcdir/${pkgname%-*}-docs"
	install -D -m644 green-book.pdf $pkgdir/usr/share/doc/${pkgname%-*}/green-book.pdf
	install -D -m644 spitbol-manual-v3.7.pdf $pkgdir/usr/share/doc/${pkgname%-*}/spitbol-manual-v3.7.pdf
}
