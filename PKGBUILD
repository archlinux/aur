# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tvision-git
pkgver=586.r553.gbb98e5f
pkgrel=1
pkgdesc="Modern port of Turbo Vision 2.0 with cross-platform and Unicode support"
arch=('x86_64')
url="https://github.com/magiblot/tvision"
license=('MIT' 'custom:publicdomain')
depends=('ncurses' 'gpm')
makedepends=('git' 'cmake')
provides=('tvision' 'libtvision.a')
conflicts=('tvision')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^r//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$pkgname" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DTV_BUILD_EXAMPLES=OFF \
		-DTV_REDUCE_APP_SIZE=ON \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "$pkgname"
	install -Dvm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
