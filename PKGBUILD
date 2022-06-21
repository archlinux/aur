# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-tic-80
pkgname=$_pkgname-git
pkgver=1.0.2164.r13.gbd6ce86
pkgrel=1
pkgdesc="TIC-80 core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://tic80.com/"
license=('MIT')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/libretro/TIC-80.git"
	'argparse::git+https://github.com/cofyc/argparse.git'
	'blip-buf::git+https://github.com/nesbox/blip-buf.git'
	'duktape-releases::git+https://github.com/svaarala/duktape-releases.git'
	'giflib::git+https://github.com/nesbox/giflib.git'
	'http-parser::git+https://github.com/nodejs/http-parser.git'
	'kuba-zip::git+https://github.com/kuba--/zip.git'
	'libpng::git+https://github.com/glennrp/libpng.git'
	'libuv::git+https://github.com/libuv/libuv.git'
	'lpeg::git+https://github.com/nesbox/lpeg.git'
	'lua::git+https://github.com/lua/lua.git'
	'moonscript::git+https://github.com/nesbox/moonscript.git'
	'squirrel::git+https://github.com/albertodemichelis/squirrel.git'
	'TIC-80::git+https://github.com/nesbox/TIC-80.git'
	'wasm3::git+https://github.com/wasm3/wasm3.git'
	'wren::git+https://github.com/wren-lang/wren.git'
	'zlib::git+https://github.com/madler/zlib.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.core.url ../TIC-80
	git submodule update
	cd core
	git config submodule.vendor/argparse.url ../../argparse
	git config submodule.vendor/blip-buf.url ../../blip-buf
	git config submodule.vendor/duktape.url ../../duktape-releases
	git config submodule.vendor/giflib.url ../../giflib
	git config submodule.vendor/http-parser.url ../../http-parser
	git config submodule.vendor/libpng.url ../../libpng
	git config submodule.vendor/libuv.url ../../libuv
	git config submodule.vendor/lpeg.url ../../lpeg
	git config submodule.vendor/lua.url ../../lua
	git config submodule.vendor/moonscript.url ../../moonscript
	git config submodule.vendor/squirrel.url ../../squirrel
	git config submodule.vendor/wasm3.url ../../wasm3
	git config submodule.vendor/wren.url ../../wren
	git config submodule.vendor/zip.url ../../kuba-zip
	git config submodule.vendor/zlib.url ../../zlib
	git submodule update
}

build() {
	cmake -S $_pkgname/core -B build \
		-DBUILD_DEMO_CARTS=OFF \
		-DBUILD_LIBRETRO=ON \
		-DBUILD_PLAYER=OFF \
		-DBUILD_SDL=OFF \
		-DBUILD_SOKOL=OFF \
		-DBUILD_WITH_MRUBY=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/lib/tic80_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
