# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=wlmaker
pkgver=0.8.1
pkgrel=1
pkgdesc='Wayland compositor inspired by WindowMaker'
url=https://github.com/phkaeser/wlmaker
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake doxygen git wayland-protocols)
depends=(bash cairo libxkbcommon libxdg-basedir wlroots0.20 xorg-xwayland)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4013692f6d5b0bfaca4702aeae10bef92e2ed510e72cbb2cced9f5eea01e749fa482e0eb0584ec72e550108f87b41e9dbba21ced8bea46ab69ef9dee7b4f1d96')

prepare() {
	for i in "$pkgname-$pkgver"{,/submodules/libbase}/CMakeLists.txt ; do
		echo "=== Patching: $i ==="
		sed -i -e 's/^\s*ELSE\s*(config_OPTIM)$/  ELSEIF (config_DEBUG)/' "$i"
	done
}

build() {
	rm -rf build
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-Dconfig_DEBUG=OFF \
		-Dconfig_OPTIM=OFF \
		-Wno-author
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
		"$pkgname-$pkgver/etc"/*.plist

	# Uneeded, contains Debian-isms.
	rm -f "$pkgdir/usr/bin/wrap-wlmaker.sh"
}
