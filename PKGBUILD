# Maintainer: Engdyn <aur cat engdyn dog de>
pkgname=libretro-ardens-git
pkgver=0.24.17.r0.2376f7d
pkgrel=1
pkgdesc="Arduboy FX core"
arch=(x86_64 i686)
url="https://github.com/tiberiusbrown/Ardens"
license=(MIT)
groups=(libretro)
depends=(
	gcc-libs
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
	git+https://github.com/richgel999/miniz.git
)
sha256sums=(
	SKIP
	SKIP
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git config submodule.deps/miniz.url "$srcdir/miniz"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -Bbuild -DARDENS_LIBRETRO=ON
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 build/ardens_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
