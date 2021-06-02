# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor:  Mike Polvere <mic.tjs@gmail.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-n64-git
pkgver=5223.0a67445c
pkgrel=3
pkgdesc="libretro implementation to Nintendo 64 e 64DD"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
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
    if [ ${CARCH} == "i686" ]; then
	makeargs="HAVE_PARALLEL=1 HAVE_PARALLEL_RSP=1 HAVE_THR_AL=1 WITH_DYNAREC=x86"
    elif [ ${CARCH} == "x86_64" ]; then
	makeargs="HAVE_PARALLEL=1 HAVE_PARALLEL_RSP=1 HAVE_THR_AL=1"
    elif [ ${CARCH} == "armv6h" ]; then
	CFLAGS="-DNO_ASM -DARM -D__arm__ -DARM_ASM -D__NEON_OPT -DNOSSE -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard"
	makeargs="HAVE_NEON=1"
    elif [ ${CARCH} == "armv7h" ]; then
	CFLAGS="-DNO_ASM -DARM -D__arm__ -DARM_ASM -D__NEON_OPT -DNOSSE -mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard"
	makeargs="HAVE_NEON=1"
    elif [ ${CARCH} == "aarch64" ]; then
	CFLAGS="-march=armv8-a+crc+simd -mtune=cortex-a72 -DNO_ASM -DARM -DARM_ASM -DDONT_WANT_ARM_OPTIMIZATIONS -DARM_FIX -DCLASSIC -DARM64"
	makeargs="HAVE_PARALLEL=1 WITH_DYNAREC=aarch64 HAVE_NEON=0 HAVE_OPENGL=0 GLES=0"
    fi
    make  ${makeargs}
}

package() {
    install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
    msg2 "\e[05;1;35mParallel-n64 requires 64DD IPL ROM BIOS file '64DD_IPL.bin' to be placed in the libretro 'system' folder. \e[0m"
}
