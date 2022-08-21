# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-stella
pkgname=$_pkgname-git
pkgver=6.7.r99.gfc0a8c91a
pkgrel=1
epoch=1
pkgdesc="Atari 2600 VCS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://stella-emu.github.io/"
license=('GPL2')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('stella-emu::git+https://github.com/stella-emu/stella.git')
b2sums=('SKIP')

pkgver() {
	cd stella-emu
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i 's/-O[0123s]//;s/-Ofast//' stella-emu/src/os/libretro/Makefile
}

build() {
	make -C stella-emu/src/os/libretro LTO=
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro stella-emu/src/os/libretro/stella_libretro.so
}
