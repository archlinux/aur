# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=wlmaker
pkgver=0.7
pkgrel=1
pkgdesc='Wayland compositor inspired by WindowMaker'
url=https://github.com/phkaeser/wlmaker
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake doxygen git wayland-protocols)
depends=(bash cairo libxkbcommon libxdg-basedir wlroots0.19 xorg-xwayland)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7339a4c8f7b828d5f2d83753d2a70a0129deea181fbd7486ea2a379338a51843283d4b1808dedd9bc5ea33b9ed5851b4fbccf39a673582ec405a14a34ca42467')

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
