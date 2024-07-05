# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=shadps4
pkgname=$_pkgname-git
pkgver=0.1.0.r20.g67af53f
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-or-later')
depends=(
	'bash'
	'crypto++>=8.9'
	'gcc-libs'
	'glibc'
	'glslang>=14.2'
	'sdl3'
	'zlib-ng>=2.1.6'
)
makedepends=(
	'boost>=1.83'
	'cmake>=3.16.3'
	'fmt>=10.2'
	'git'
	'magic_enum>=0.9.5'
	'rapidjson'
	'robin-map>=1.3'
	'spirv-headers'
	'toml11>=3.8.1'
	'vulkan-headers>=1:1.3.288'
	'vulkan-memory-allocator>=3.1'
	'xbyak>=7.07'
	'xxhash>=0.8.2'
	'zydis>=4.1'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/shadps4-emu/shadPS4.git"
	"$_pkgname-discord-rpc::git+https://github.com/shadps4-emu/ext-discord-rpc.git"
	"$_pkgname-sirit::git+https://github.com/shadps4-emu/sirit.git"
	"$_pkgname-tracy::git+https://github.com/shadps4-emu/tracy.git"
	"hwinfo::git+https://github.com/lfreist/hwinfo.git"
	"$_pkgname.sh"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'03abf49a4be0a1308baa2a8d6abe9e4d8cbd5e3fb5b87855d6466f7b21892382fd9e2d574c96cd52bb64f8a529725a3ef3e2994ed5e477be8a25b69052c38483'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.externals/discord-rpc.url ../$_pkgname-discord-rpc
	git config submodule.externals/hwinfo.url ../hwinfo
	git config submodule.externals/sirit.url ../$_pkgname-sirit
	git config submodule.externals/tracy.url ../$_pkgname-tracy
	git -c protocol.file.allow=always submodule update
	sed -ri '/find_package/s/\b[.0-9]+\b//' CMakeLists.txt
}

build() {
	cmake -B build -S $_pkgname \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DNO_OCL=ON \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libfmt.so' 'libxxhash.so' 'libZydis.so')
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/$_pkgname build/shadps4
	install -D $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
}
