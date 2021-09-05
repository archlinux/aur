# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=sioyek-git
pkgver=0.31
pkgrel=6
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
	install -Dm755 build/sioyek $pkgdir/usr/bin/sioyek
	install -Dm755 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	for config in keys.config keys_user.config prefs.config prefs_user.config; do
		install -Dm644 build/$config -t $pkgdir/"$HOME/.config/${pkgname%-git}"
	done

	mkdir -p $pkgdir"$HOME/.local/share/${pkgname%-git}"
	cp build/tutorial.pdf $pkgdir"$HOME/.local/share/${pkgname%-git}"
	cp -r build/shaders $pkgdir"$HOME/.local/share/${pkgname%-git}"
}
