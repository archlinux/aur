# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=shadps4-qtlauncher
pkgname=$_pkgname-git
pkgver=r339.88b3425
pkgrel=1
pkgdesc="Sony PlayStation 4 emulator (Qt GUI)"
arch=('aarch64' 'x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'hicolor-icon-theme'
	'sdl3>=3.1.8'
)
makedepends=(
	'cmake>=3.16.3'
	'fmt>=10.2'
	'git'
	'libgcc'
	'libstdc++'
	'openal'
	'qt6-base'
	'qt6-multimedia'
	'qt6-tools'
	'toml11>=4.2'
	'vulkan-headers>=1:1.4.329'
	'zarchive>=0.1.2'
)
optdepends=('shadps4: for emulation support')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/shadps4-emu/shadps4-qtlauncher.git"
	"nlohmann-json::git+https://github.com/nlohmann/json.git"
	"spdlog::git+https://github.com/gabime/spdlog.git"
	"volk::git+https://github.com/zeux/volk.git"
)
b2sums=('SKIP'{,,,})

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.externals/json.url ../nlohmann-json
	git config submodule.externals/spdlog.url ../spdlog
	git config submodule.externals/volk.url ../volk
	git -c protocol.file.allow=always submodule update
	# use makepkg.conf flags
	sed -i '/-march=/d' CMakeLists.txt
}

build() {
	local options=(
		-B ../build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_SKIP_INSTALL_RPATH=ON
		-D ENABLE_UPDATER=OFF
		-W no-dev
	)
	cd $_pkgname
	cmake "${options[@]}"
	cmake --build ../build
}

package() {
	depends+=(
		'libfmt.so'
		'libgcc_s.so'
		'libopenal.so'
		'libstdc++.so'
		'libzarchive.so'
		'qt6-base'
		'qt6-multimedia'
	)

	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
