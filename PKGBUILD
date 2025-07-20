# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>
# Contributor: Ash <xash at riseup d0t net>

pkgname=lsfg-vk-git
pkgver=r193.dd5190a
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux via DXVK/Vulkan"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=(
	'vulkan-icd-loader'
	'bash'
	'gcc-libs'
	'libglvnd'
)
makedepends=(
	'clang'
	'llvm'
	'vulkan-headers'
	'cmake'
	'meson'
	'ninja'
	'git'
	'sed'
	'sdl3'
	'glslang'
	'spirv-headers'
	'libxrandr'
	'libxinerama'
	'libxi'
	'libxkbcommon'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'git+https://github.com/PancakeTAS/lsfg-vk'
	'git+https://github.com/PancakeTAS/dxbc.git'
	'git+https://github.com/trailofbits/pe-parse'
	'git+https://github.com/ToruNiina/toml11'
	'git+https://github.com/raysan5/raylib'
)
sha256sums=(
	'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
install=lsfg-vk.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	git submodule init

	git config submodule.dxbc.url "$srcdir/dxbc"
	git config submodule.pe-parse.url "$srcdir/pe-parse"
	git config submodule.toml11.url "$srcdir/toml11"
	git config submodule.raylib.url "$srcdir/raylib"

	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# Unset certain default makepkg flags that strip out necessary symbols in the linker
	export LDFLAGS="${LDFLAGS//-Wl,-z,now/} -Wl,-z,lazy"
	export CFLAGS="${CFLAGS//-flto=auto/}"

	cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS"
    cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm644 VkLayer_LS_frame_generation.json "$pkgdir/etc/vulkan/implicit_layer.d/VkLayer_LS_frame_generation.json"
	install -Dm644 build/liblsfg-vk.so "$pkgdir/usr/lib/liblsfg-vk.so"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
