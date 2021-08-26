# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor:  Mike Polvere <mic.tjs@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-n64-git
pkgver=r5223.0a67445c
pkgrel=1
epoch=1
pkgdesc="Nintendo 64 core"
arch=(x86_64 i686  armv6h armv7h aarch64)
url="https://github.com/libretro/parallel-n64"
license=(GPL2 'custom:multiple OSI licenses')
groups=(libretro)
depends=(libgl libretro-core-info)
makedepends=(git mesa)
provides=(libretro-parallel-n64)
conflicts=(libretro-parallel-n64)
source=("${pkgname}::git+https://github.com/libretro/parallel-n64")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
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
  cd "$pkgname"
  install -Dm644 parallel_n64_libretro.so -t "${pkgdir}/usr/lib/libretro/"
  install -Dm644 mupen64plus-core/LICENSES -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
