# Maintainer: Engdyn <aur cat engdyn dog de>
pkgname=libretro-wasm4-git
pkgver=r1863.0ebe62a
pkgrel=1
pkgdesc="WASM-4 core"
arch=(x86_64 aarch64)
url="https://github.com/aduros/wasm4"
license=(ISC)
groups=(libretro)
depends=(
	libretro-core-info
)
makedepends=(
	git
	cmake
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=(
	${pkgname%-git}::git+$url.git
	git+https://github.com/wasm3/wasm3
)
sha256sums=(
	SKIP
	SKIP
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git config submodule.runtimes/native/vendor/wasm3.url "$srcdir/wasm3"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}/runtimes/native"
	cmake -Bbuild -DLIBRETRO=ON -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 runtimes/native/build/wasm4_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
