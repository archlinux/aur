# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor:  Mike Polvere <mic.tjs@gmail.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-n64-git
pkgver=5223.0a67445c
pkgrel=1
pkgdesc="libretro implementation to Nintendo 64 e 64DD"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/parallel-n64"
license=('GPL2')
groups=('libretro')
depends=('libgl' 'libretro-core-info')
conflicts=('libretro-parallel-n64')
makedepends=('git' 'mesa')

_libname=parallel_n64_libretro
_gitname=parallel-n64
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${_gitname}"
    makeargs="HAVE_PARALLEL=1 HAVE_PARALLEL_RSP=1 HAVE_THR_AL=1"
    if [ $CARCH == "i686" ];then
	make WITH_DYNAREC=x86 ${makeargs}
    else
	make WITH_DYNAREC=$CARCH ${makeargs}
    fi
}

package() {
    install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
    msg2 "\e[05;1;35mParallel-n64 requires 64DD IPL ROM BIOS file '64DD_IPL.bin' to be placed in the libretro 'system' folder. \e[0m"
}
