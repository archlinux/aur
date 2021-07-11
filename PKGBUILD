# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r11710.1c0004153
pkgrel=2
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/pcsx2"
license=('GPL2' 'GPL3' 'LGPL2.1' 'LGPL3')
groups=('libretro')
depends=('fmt' 'glib2' 'libaio' 'libgl' 'libretro-core-info' 'systemd-libs')
makedepends=('ccache' 'cmake' 'git' 'libglvnd' 'systemd' 'vim')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# https://github.com/libretro/pcsx2/commit/c7ee173a81bc03a2e4f4d496d0157645f8e5852f
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_LINK_WHAT_YOU_USE=TRUE \
		-DLIBRETRO=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/pcsx2/pcsx2_libretro.so
}
