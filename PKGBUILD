# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=rpcsx
pkgname=$_pkgname-git
pkgver=r491.068d95c
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator"
arch=('x86_64')
url="https://rpcsx.github.io/rpcsx-site/"
license=('GPL-2.0-only AND MIT')
depends=(
	'gcc-libs'
	'glfw>=3.3'
	'glibc'
	'libunwind'
)
makedepends=(
	'cmake'
	'git'
	'python'
	'sox'
	'spirv-cross'
	'spirv-tools'
	'vulkan-headers>=1:1.3'
	'vulkan-icd-loader>=1.3'
)
optdepends=('vulkan-validation-layers: for rpcsx-gpu --validate')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/RPCSX/rpcsx.git"
	"$_pkgname-xbyak::git+https://github.com/RPCSX/xbyak.git"
	'glslang::git+https://github.com/KhronosGroup/glslang.git'
	'json::git+https://github.com/nlohmann/json.git'
	'SPIRV-Cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git'
	'SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git'
	'SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git'
)
b2sums=(
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.3rdparty/glslang.url ../glslang
	git config submodule.3rdparty/json.url ../json
	git config submodule.3rdparty/SPIRV-Cross.url ../SPIRV-Cross
	git config submodule.3rdparty/SPIRV-Headers.url ../SPIRV-Headers
	git config submodule.3rdparty/SPIRV-Tools.url ../SPIRV-Tools
	git config submodule.3rdparty/xbyak.url ../$_pkgname-xbyak
	git -c protocol.file.allow=always submodule update
	# https://github.com/RPCSX/rpcsx/issues/33
	sed -i 's/-march=native/-mfsgsbase/' rpcsx-os/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libsox.so' 'libvulkan.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/orbis-kernel/LICENSE
}
