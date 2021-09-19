# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=sioyek-git
pkgver=0.31.6
pkgrel=2
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
	cd $pkgname
	git submodule update --init --recursive
	sed -i 's/\/\/#define LINUX_STANDARD_PATHS/#define LINUX_STANDARD_PATHS/' pdf_viewer/main.cpp
}

build() {
	cd $pkgname
	./build_linux.sh
}

package() {
	cd $pkgname
	install -Dm755 ./build/sioyek $pkgdir/usr/bin/sioyek

	install -Dm755 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 ./resources/sioyek-icon-linux.png ${pkgdir}/usr/share/icons/${pkgname%-git}-icon-linux.png
	install -Dm644 ./resources/${pkgname%-git}.desktop $pkgdir/usr/share/applications/${pkgname%-git}.desktop

	mkdir $pkgdir/usr/share/sioyek
	install -Dm644 -t $pkgdir/etc/xdg/sioyek build/keys_user.config build/prefs_user.config
	install -Dm644 -t $pkgdir/usr/share/sioyek build/keys.config build/prefs.config build/tutorial.pdf
	cp -r build/shaders $pkgdir/usr/share/sioyek

	echo "Data files can be found in /usr/share/sioyek"
	echo "Be sure to copy them to the according locations"
}
