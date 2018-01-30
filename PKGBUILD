pkgname=myhtml-git
pkgver=20180110
pkgrel=1
pkgdesc="Fast HTML parser using threads implemented as a pure C99 library with no outside dependencies"
arch=('i686' 'x86_64')
makedepends=('git')
url="https://github.com/lexborisov/myhtml"
license=('LGPL')
source=(git+https://github.com/lexborisov/myhtml)
sha256sums=('SKIP')
provides=('myhtml')
conflicts=('myhtml')

pkgver() {
	cd myhtml
	git log -1 --format="%cd" --date=short | sed "s/-//g"
}

build() {
	cd myhtml
	msg2 'Building...'
	make CFLAGS=-Wno-pedantic prefix=/usr
}

package() {
	cd myhtml

	msg2 'Installing license...'
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE

	msg2 'Installing documentation...'
	install -Dm644 README.md "$pkgdir"/usr/share/doc/${pkgname%-git}/README.md
	cp -dpr --no-preserve=ownership examples "$pkgdir"/usr/share/doc/${pkgname%-git}

	msg2 'Installing pkg-config...'
	install -Dm644 myhtml.pc "$pkgdir"/usr/lib/pkgconfig/myhtml.pc

	msg2 'Installing...'
	make prefix="$pkgdir/usr/" install
}
