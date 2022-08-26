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
pkgver=4.2.0
_suffix=.20211231
pkgrel=1
pkgdesc="C library for bare metal systems (${_target})."
arch=(any)
url="https://sourceware.org/newlib/"
license=('BSD')
groups=(devel)
depends=("${_target}-binutils")
makedepends=("${_target}-gcc-bootstrap")
options=('!makeflags' '!strip' 'staticlibs' '!libtool')
PKGEXT="pkg.tar.zst"
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}${_suffix}.tar.gz")
sha512sums=('0c3efd7b74a6b8457a717cbb6aa6c5ff268eeaba375535465c6bd6502c3d32b54a9bc3ba7f2c6990f78e29152eee2f62acb39b674d24f9ddf440374a1ec9d2e8')

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
}
