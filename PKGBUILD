# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive <almostalive2003 at gmail dot com>
_pkgname=libretro-desmume
pkgname=$_pkgname-git
pkgver=r6359.b518fec5
pkgrel=1
pkgdesc="Nintendo DS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/desmume"
license=('GPL-2.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git' 'libgl' 'libpcap')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	sed -i 's/-O[0123s]//' desmume/src/frontend/libretro/Makefile.libretro
}

build() {
	cd $_pkgname
	make -C desmume/src/frontend/libretro
}

package() {
	depends+=('libGL.so')
	cd $_pkgname
	# shellcheck disable=SC2154
	make -C desmume/src/frontend/libretro DESTDIR="$pkgdir" install
}
