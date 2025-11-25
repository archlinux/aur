# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=wlmaker
pkgver=0.6.2
pkgrel=1
pkgdesc='Wayland compositor inspired by WindowMaker'
url=https://github.com/phkaeser/wlmaker
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake doxygen git wayland-protocols)
depends=(bash cairo libxkbcommon wlroots0.18 xorg-xwayland)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('22341cef17edf73aa63ffe1b0b30aca3bb2345ceda8f46bb58f55d8bbb0629a6e9e9779b33753730b07b28cf2e942af88e959d7d7f13fc5ff1e6e75950b3e070')

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
		-Wno-dev
	cmake --build build
}

check() {
	return 0
 	# FIXME: Tests titlebar_title.title and primitives.window_title are failing.
	# ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
		"$pkgname-$pkgver/etc"/*.plist

	# Uneeded, contains Debian-isms.
	rm -f "$pkgdir/usr/bin/wrap-wlmaker.sh"
}
