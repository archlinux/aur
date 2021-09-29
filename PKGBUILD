# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=sioyek-git
pkgver=0.31.6
pkgrel=4
pkgdesc="PDF viewer for research papers and technical books."
arch=('any')
license=('GPL3')
provides=('sioyek')
url="https://github.com/ahrm/sioyek"
depends=('qt5-base' 'qt5-3d' 'harfbuzz')
makedepends=('git')
source=("$pkgname::git+https://github.com/ahrm/sioyek")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
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
	mkdir -p "$pkgdir/etc/sioyek"
	install -Dm644 -t "$pkgdir/usr/share/sioyek" build/tutorial.pdf
	install -Dm644 -t "$pkgdir/etc/sioyek" build/keys.config build/prefs.config
	cp -r build/shaders "$pkgdir/usr/share/sioyek"
}
