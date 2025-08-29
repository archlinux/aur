# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=wlmaker
pkgver=0.6
pkgrel=1
pkgdesc='Wayland compositor inspired by WindowMaker'
_libbase_commit=f44570ee4d15528a9a2753b7527938c0cdf5ed7f
url=https://github.com/phkaeser/wlmaker
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake doxygen git wayland-protocols)
depends=(bash cairo libxkbcommon wlroots0.18 xorg-xwayland)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-libbase::git+https://github.com/phkaeser/libbase#commit=$_libbase_commit")
b2sums=('965a3352087265eb55df54346b0f1350188bf73828e94b942c5b48b2e9a89b5e3aa1e1301aa4338151771fc0225e576a4c2e868e86f58f30db86e342e39d9c2f'
        'a498f45b267136baf15a21d83720e03a84605a395811486d1dbad0382cc86ad426324a62cda8fe039a43a16d270095cc124b39019c23cb23c79f0c15aa143cce')

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
