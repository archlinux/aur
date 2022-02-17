# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=sioyek-git
pkgver=20220216
pkgrel=1
pkgdesc="PDF viewer for research papers and technical books."
arch=('any')
license=('GPL3')
provides=('sioyek')
url="https://github.com/ahrm/sioyek"
depends=('qt5-base' 'qt5-3d' 'harfbuzz' 'gzip' 'libmupdf' 'zlib' 'gumbo-parser' 'openjpeg2' 'jbig2dec')
makedepends=('git')
source=("$pkgname::git+https://github.com/ahrm/sioyek")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/sioyek-git"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
	cd "$pkgname"
	sed -i 's/-lmupdf-third -lmupdf-threads -lharfbuzz/-lmupdf-third -lharfbuzz -lfreetype -lgumbo -ljbig2dec -lopenjp2 -ljpeg/' pdf_viewer_build_config.pro
	sed -i 's/\/\/#define LINUX_STANDARD_PATHS/#define LINUX_STANDARD_PATHS/' pdf_viewer/main.cpp
}

build() {
	cd "$pkgname"
	./build_linux.sh
}

package() {
	cd "$pkgname"
	install -Dm755 ./build/sioyek "$pkgdir/usr/bin/sioyek"

	install -Dm755 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 ./resources/sioyek-icon-linux.png "$pkgdir/usr/share/icons/${pkgname%-git}-icon-linux.png"
	install -Dm644 ./resources/${pkgname%-git}.desktop "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

	mkdir -p "$pkgdir/usr/share/sioyek"
	install -Dm644 -t "$pkgdir/usr/share/sioyek" build/tutorial.pdf
	cp -r build/shaders "$pkgdir/usr/share/sioyek"

	mkdir -p "$pkgdir/etc/sioyek"
	install -Dm644 -t "$pkgdir/etc/sioyek" build/keys.config build/prefs.config

	mkdir -p "$pkgdir/usr/share/man/man1"
	install -Dm644 -t "$pkgdir/usr/share/man/man1" resources/sioyek.1
	gzip "$pkgdir/usr/share/man/man1/sioyek.1"
}
