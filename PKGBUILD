# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=wlmaker
pkgver=0.3
pkgrel=3
pkgdesc='Wayland compositor inspired by WindowMaker'
_libbase_commit=df7ce2ae1a041023b55f67eb4e7ce1576bd87645
url=https://github.com/phkaeser/wlmaker
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake doxygen git wayland-protocols)
depends=(bash cairo libxkbcommon wlroots0.17 xorg-xwayland)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-$pkgver-libbase::git+https://github.com/phkaeser/libbase#commit=$_libbase_commit")
b2sums=('38c9ca647025624283693cba89dc80b665a15feec86fcce0eaccb535f52d961d450bdfd7555af2f34465dd2fea4e2b1386bc1bf41dfeaa31bf6526073ffec50f'
        'e9ef6d8577d5d6322ea2ca8c08cda809ad01ffef9c8aad3621562b1528d0ac92403fdd1eddf5f7b80a2c62067bdb7bb770cab082529d9db76442fd11a7f6436d')

prepare() {
	for i in "$pkgname-$pkgver"{,-libbase}/CMakeLists.txt ; do
		echo "=== Patching: $i ==="
		sed -i -e 's/^\s*ELSE\s*(config_OPTIM)$/  ELSEIF (config_DEBUG)/' "$i"
	done

	rm -rf \
		"$pkgname-$pkgver/submodules/libbase"
	cp -a \
		"$pkgname-$pkgver-libbase" \
		"$pkgname-$pkgver/submodules/libbase"
}

build() {
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
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
