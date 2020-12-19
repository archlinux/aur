# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-newlib
pkgver=4.1.0
pkgrel=1
pkgdesc="C library for bare metal systems for the ${_target} target."
arch=(any)
url="https://sourceware.org/newlib/"
license=('BSD')
groups=(devel)
depends=("${_target}-gcc-stage1" "${_target}-binutils")
options=('!makeflags' '!strip' 'staticlibs' '!libtool')
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz")
sha256sums=('f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154')

prepare() {
  cd "${srcdir}/newlib-${pkgver}"

  [[ -d newlib-build ]] && rm -rf newlib-build
  mkdir newlib-build
}

build() {
  cd "${srcdir}/newlib-${pkgver}/newlib-build"

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"
  ../configure \
    --prefix=/usr \
    --target=${_target} \
    --disable-newlib-supplied-syscalls \
    --enable-newlib-reent-small \
    --disable-newlib-fseek-optimization \
    --disable-newlib-wide-orient \
    --enable-newlib-nano-formatted-io \
    --disable-newlib-io-float \
    --enable-newlib-nano-malloc \
    --disable-newlib-unbuf-stream-opt \
    --enable-lite-exit \
    --enable-newlib-global-atexit \
    --disable-nls

  make -j1
}

package() {
  cd "${srcdir}/newlib-${pkgver}/newlib-build"
  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}/usr/share"

  install -d -m755 "${pkgdir}/usr/${_target}/usr"
  cd "${pkgdir}/usr/${_target}/usr"
  ln -s ../lib .
  ln -s ../include .
}

# vim:set ts=2 sw=2 et:
