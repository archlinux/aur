# Maintainer: Jesus Alonso <doragasu at hotmail dot com>
# NOTE: As I want these packages for Genesis/Megadrive development, they do
# only support the m68000 CPU. If you want to support other m68k variants,
# either modify _target_cpu to suit your needs, or go wild, remove the
# --with-cpu switches and change --disable-multilib with --enable-multilib.
# Be warned that multilib packages will take a lot more time to build, and
# will also require more disk space.

_target=m68k-elf
_target_cpu=m68000
pkgname=${_target}-newlib
pkgver=4.3.0
_suffix=.20230120
pkgrel=2
pkgdesc="C library for bare metal systems (${_target})."
arch=(any)
url="https://sourceware.org/newlib/"
license=('BSD')
groups=(devel)
depends=("${_target}-binutils")
makedepends=("${_target}-gcc-bootstrap>=4.3.0")
options=('!makeflags' '!strip' 'staticlibs' '!libtool')
PKGEXT="pkg.tar.zst"
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}${_suffix}.tar.gz")
sha512sums=('4a06309d36c2255fef8fc8f2d133cafa850f1ed2eddfb27b5d45f5d16af69e0fca829a0b4c9b34af4ed3a28c6fcc929761e0ee823a4229f35c2853d432b5e7ef')

prepare() {
  mkdir ${srcdir}/newlib-build
}

build() {
  cd ${srcdir}/newlib-build

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections -fomit-frame-pointer -ffast-math"
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
