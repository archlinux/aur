# Maintainer: leap123 <leap123 at canaglie dot org>
# Contributor: Jesus Alonso <doragasu at hotmail dot com>

_target=m68k-palmos-elf
_target_cpu=m68000
pkgname=${_target}-newlib
# Latest version 4.4.0.20231231 does not build with GCC 14.1, so stay in previous release
pkgver=4.3.0
_suffix=.20230120
pkgrel=1
pkgdesc="C library for bare metal systems (${_target})."
arch=(any)
url="https://sourceware.org/newlib/"
license=('BSD')
groups=(devel)
depends=("${_target}-binutils")
makedepends=("${_target}-gcc-bootstrap>=4.3.0")
options=('!makeflags' '!strip' 'staticlibs' '!libtool')
PKGEXT="pkg.tar.zst"
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}${_suffix}.tar.gz"
        palm.patch)
sha512sums=('4a06309d36c2255fef8fc8f2d133cafa850f1ed2eddfb27b5d45f5d16af69e0fca829a0b4c9b34af4ed3a28c6fcc929761e0ee823a4229f35c2853d432b5e7ef'
            'a2543c0919b2366058e265f30c4803426200eb25fa4817591273b899780661b1be2475044274f15f9675c9e3711ac4ca82740dfde7389a441afb51565fb9214f')

prepare() {
  cd ${srcdir}/newlib-${pkgver}${_suffix}
  patch -Np1 -i ../palm.patch
  mkdir ${srcdir}/newlib-build
}

build() {
  cd ${srcdir}/newlib-build

  # Should remove -Wno-implicit-function-declaration and -Wno-implicit-int when newlib fixes the build
  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections -fomit-frame-pointer -ffast-math -Wno-implicit-function-declaration -Wno-implicit-int"
  ../newlib-${pkgver}${_suffix}/configure \
    --target=${_target} \
    --prefix=/usr \
    --disable-newlib-supplied-syscalls \
    --disable-multilib \
    --with-cpu=${_target_cpu} \
    --disable-nls

  make
}

package() {
    cd ${srcdir}/newlib-build
    DESTDIR=${pkgdir}/ make install
    # usr/share/info/porting.info.gz conflicts with newlib installs for other architectures
    rm -r ${pkgdir}/usr/share
}
