# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-melondsds
pkgname=$_pkgname-git
pkgver=1.2.0.r1.g5d2ece5
pkgrel=2
pkgdesc="Nintendo DS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/JesseTG/melonds-ds"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info>=1.17')
makedepends=('cmake>=3.19' 'git' 'libgl')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto') # https://github.com/melonDS-emu/melonDS/issues/2314
source=(
	"$_pkgname::git+$url.git"
	"date::git+https://github.com/HowardHinnant/date.git"
	"embed-binaries::git+https://github.com/andoalon/embed-binaries.git"
	"fmt::git+https://github.com/fmtlib/fmt.git"
	"glm::git+https://github.com/g-truc/glm.git"
	"jessetg-libretro-common::git+https://github.com/JesseTG/libretro-common.git"
	"jessetg-libslirp::git+https://github.com/JesseTG/libslirp-mirror.git"
	"jessetg-melonds::git+https://github.com/JesseTG/melonDS.git"
	"pntr::git+https://github.com/RobLoach/pntr.git"
	"span-lite::git+https://github.com/martinmoene/span-lite.git"
	"yamc::git+https://github.com/yohhoy/yamc.git"
	"zlib::git+https://github.com/madler/zlib.git"
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
)

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		-D DATE_REPOSITORY_URL="$srcdir"/date
		-D EMBED_BINARIES_REPOSITORY_URL="$srcdir"/embed-binaries
		-D ENABLE_LTO_RELEASE=OFF
		-D FMT_REPOSITORY_URL="$srcdir"/fmt
		-D GLM_REPOSITORY_URL="$srcdir"/glm
		-D LIBRETRO_COMMON_REPOSITORY_URL="$srcdir"/jessetg-libretro-common
		-D LIBSLIRP_REPOSITORY_URL="$srcdir"/jessetg-libslirp
		-D MELONDS_REPOSITORY_URL="$srcdir"/jessetg-melonds
		-D PNTR_REPOSITORY_URL="$srcdir"/pntr
		-D SPAN_LITE_REPOSITORY_URL="$srcdir"/span-lite
		-D YAMC_REPOSITORY_URL="$srcdir"/yamc
		-D ZLIB_REPOSITORY_URL="$srcdir"/zlib
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=('libOpenGL.so')
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/src/libretro/melondsds_libretro.so
	install -Dm644 build/melondsds-LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
