# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-lrps2
pkgname=$_pkgname-git
pkgver=r19965.9f9dd1e
pkgrel=1
pkgdesc="Sony PlayStation 2 core (fork of PCSX2)"
arch=('x86_64')
url="https://github.com/libretro/ps2"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('cmake' 'git' 'libgl' 'libstdc++')
provides=("$_pkgname=${pkgver#r}" 'libretro-pcsx2')
conflicts=("$_pkgname" 'libretro-pcsx2')
replaces=('libretro-pcsx2')
options=('!lto')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	# fix fallocate
	sed -i '1i #define _GNU_SOURCE' libretro/libretro-common/vfs/vfs_implementation.c
}

build() {
	local options=(
		-B ../build
		-D CCACHE_FOUND=OFF
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D LTO_PCSX2_CORE=ON
		-W no-dev
	)
	cd $_pkgname
	cmake "${options[@]}"
	cmake --build ../build
}

package() {
	depends+=('libstdc++.so')

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/bin/pcsx2_libretro.so
}
