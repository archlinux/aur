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
# Latest version 4.4.0.20231231 does not build with GCC 14.1, so stay in previous release
pkgver=4.6.0
_suffix=.20260123
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
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}${_suffix}.tar.gz")
sha512sums=('ffa16d6465c0b429264c46395fa760fbcf072d3ff86e87330ba1f483efcfe66393ef83b03932759444a0ebeaef94d3ca58a59e91ab7b97b2a6ac6be2e7589657')

prepare() {
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
