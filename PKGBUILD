# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r11469.9addce2e5
pkgrel=1
pkgdesc="PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/pcsx2"
license=('GPL2' 'GPL3' 'LGPL2.1' 'LGPL3')
groups=('libretro')
depends=('libretro-core-info' 'glib2' 'libaio' 'libglvnd' 'libpng' 'systemd-libs')
makedepends=('git' 'cmake' 'ccache' 'systemd')
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
		-DCMAKE_LINK_WHAT_YOU_USE=TRUE # doesn't link without this, but I don't know why xD
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/pcsx2/pcsx2_libretro.so
}
