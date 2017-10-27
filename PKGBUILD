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
pkgver=2.5.0
pkgrel=1
pkgdesc="C library for bare metal systems (${_target})."
arch=(any)
url="https://sourceware.org/newlib/"
license=('BSD')
groups=(devel)
depends=("${_target}-gcc-bootstrap" "${_target}-binutils")
options=('!makeflags' '!strip' 'staticlibs' '!libtool')
source=("ftp://mirrors.kernel.org/sourceware/newlib/newlib-${pkgver}.tar.gz")
sha256sums=('5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b')

prepare() {
  mkdir ${srcdir}/newlib-build
}

build() {
  cd ${srcdir}/newlib-build

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections -fomit-frame-pointer -ffast-math"
  ../newlib-${pkgver}/configure \
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
