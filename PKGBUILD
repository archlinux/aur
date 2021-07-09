# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r11710.1c0004153
pkgrel=1
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/pcsx2"
license=('GPL2' 'GPL3' 'LGPL2.1' 'LGPL3')
groups=('libretro')
depends=('fmt' 'glib2' 'libaio' 'libglvnd' 'libretro-core-info' 'systemd-libs')
makedepends=('ccache' 'cmake' 'git' 'systemd' 'vim')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DLIBRETRO=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/pcsx2/pcsx2_libretro.so
}
