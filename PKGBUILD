# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-play
pkgname=$_pkgname-git
pkgver=0.62.r13.gcdf50b96
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
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
	cmake -S $_pkgname -B build \
		-DBUILD_LIBRETRO_CORE=ON \
		-DBUILD_PLAY=OFF \
		-DBUILD_TESTS="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DENABLE_AMAZON_S3=OFF \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	depends+=(
		'libbz2.so'
		'libchdr.so'
		'libGLEW.so'
		'libGL.so'
		'libxxhash.so'
		'libz.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/Source/ui_libretro/play_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/License.txt
}
