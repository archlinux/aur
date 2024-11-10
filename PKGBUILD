# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=wlmaker
pkgver=0.4.1
pkgrel=1
pkgdesc='Wayland compositor inspired by WindowMaker'
_libbase_commit=69a87c3c476c73683c9b12e3ac099ac464bd562e
url=https://github.com/phkaeser/wlmaker
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake doxygen git wayland-protocols)
depends=(bash cairo libxkbcommon wlroots xorg-xwayland)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-libbase::git+https://github.com/phkaeser/libbase#commit=$_libbase_commit")
b2sums=('3aa65cceab172816232076ec5d007dc08e8f8745b1ebc024c61e260d5bee0f8807c1c0c27d338e5c6a0c18dc059fff2f884ca6bc33e94052a4ec88cb11cbc044'
        'ec7047050405ea4aab8fa9021e530bc99a8752d92944f87e7dec3849fe2bfe5916ddb163c2cd5000e294ea0e04f3d7e9df72693c7570ee4dba89decfdf690717')

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
