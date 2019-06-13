# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=wineasio-git
pkgver=r50.4b23797
pkgrel=1
pkgdesc='WineASIO provides an ASIO to JACK driver for WINE.'
arch=('i686' 'x86_64')
url='https://github.com/jhernberg/wineasio'
license=(LGPL)
depends=('wine' 'jack')
depends_x86_64+=('lib32-jack')
makedepends=('ed' 'steinberg-asio-sdk')
makedepends_x86_64+=('gcc-multilib' 'mingw-w64-headers')
conflicts=(wineasio)
provides=(wineasio)
install=wineasio.install
source=("${pkgname}::git+https://github.com/jhernberg/wineasio"
        "unicode.h")
sha256sums=('SKIP'
            'a552e487cba95883a15db612ae646df5d502a39afd7c4805b4ca0b549cc2f522')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

	cp /usr/include/steinberg-asio/asio.h asio.h

	mkdir -p wine
	cp "${srcdir}/unicode.h" wine/unicode.h

	if [[ "$CARCH" == x86_64 ]]; then
		cp asio.h asio.h.i686
		./prepare_64bit_asio
	fi
}

build() {
	cd "$srcdir/$pkgname"

	if [[ "$CARCH" == x86_64 ]]; then
		make -f Makefile64
		mv wineasio.dll.so wineasio.dll.so.x86_64
		cp asio.h.i686 asio.h
		make clean
	fi

	make
}

package() {
	cd "$srcdir/$pkgname"

	if [[ "$CARCH" == x86_64 ]]; then
		install -D -m755 wineasio.dll.so.x86_64 "$pkgdir"/usr/lib/wine/wineasio.dll.so
		install -D -m755 wineasio.dll.so "$pkgdir"/usr/lib32/wine/wineasio.dll.so
	else
		install -D -m755 wineasio.dll.so "$pkgdir"/usr/lib/wine/wineasio.dll.so
	fi

	install -D -m644 README "$pkgdir"/usr/share/"$pkgname"/README
}
