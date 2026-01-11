# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-play
pkgname=$_pkgname-git
pkgver=0.72.r5.gbb6896e
pkgrel=1
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://purei.org/"
license=('MIT')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=(
	'bzip2'
	'cmake'
	'ghc-filesystem'
	'git'
	'glew'
	'icu'
	'libchdr'
	'libgl'
	'openssl'
	'xxhash'
	'zlib'
	'zstd'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/jpd002/Play-.git"
	'git+https://github.com/jpd002/Play--CodeGen.git'
	'git+https://github.com/jpd002/Play--Framework.git'
	'git+https://github.com/jpd002/Play-Dependencies.git'
	'git+https://github.com/facebook/zstd.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'ee225cdbdc5452bcbf3d83e945080cafcd0baeb7d571798a9e9f61cb97387f701918d8b96df1f2f1768458bc7ab9d6173aca61b9272efcd4241e1e6883cc7dbb'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.deps/CodeGen.url ../Play--CodeGen
	git config submodule.deps/Dependencies.url ../Play-Dependencies
	git config submodule.deps/Framework.url ../Play--Framework
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
	cd deps/Dependencies
	git config submodule.zstd.url ../../../zstd
	git -c protocol.file.allow=always submodule update
}

build() {
	local options=(
		-D BUILD_LIBRETRO_CORE=ON
		-D BUILD_PLAY=OFF
		-D BUILD_TESTS="$CHECKFUNC"
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D ENABLE_AMAZON_S3=OFF
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

check() {
	ctest --output-on-failure --test-dir build
}

package() {
	depends+=(
		'libbz2.so'
		'libchdr.so'
		'libGLEW.so'
		'libGLX.so'
		'libOpenGL.so'
		'libxxhash.so'
		'libz.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/Source/ui_libretro/play_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/License.txt
}
