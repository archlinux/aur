# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-stella
pkgname=$_pkgname-git
pkgver=6.6.r159.gfc1d87f6d
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
	sed -i 's/-O[0123s]//;s/-Ofast//' stella-emu/src/libretro/Makefile
}

build() {
	# https://github.com/stella-emu/stella/issues/806
	CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
	make -C stella-emu/src/libretro LTO=
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro stella-emu/src/libretro/stella_libretro.so
}
