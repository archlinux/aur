# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

pkgname=mingw-w64-fribidi
pkgver=1.0.16
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64)"
arch=('any')
license=(LGPL-2.1-or-later)
url="https://github.com/fribidi/fribidi"
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs' '!debug')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'git')
source=(
  "git+$url?signed#tag=v$pkgver"
#  "git+https://github.com/fribidi/c2man#commit=577ed4095383ef5284225d45709e6b5f0598a064"
  "testrunnerwine.patch"
)
b2sums=('afbe4ef82ccafacca4a344d83e6cfb654e10cad205b885fb3756c70301e9ed0e2ff8c2c650b2805bb7eda82bd39b9a9dead0d0c4fb7c35a40c9313ad92996658'
#        '4ce1f0e039bbac3d7015eff10b9738ac4b58dc59f736a8f7ba12857d67092444f500928447a08004ae3548ffb2c788a849ac76c89924db2d82653f547cc4cc6a')
        'b4a3a06cfbedf92959b2d5ceb7714957c7f42cd9b7bb02cebcf867c929cdc2922f836310e3464e10bbc89f6788ea9bbaf2f20914db78db7169801cffdffd98af')
validpgpkeys=(
  0AD041B27CA166DDA1FE3BAEA7B3409C0CA4ED14 # Dov Grobgeld <dov.grobgeld@gmail.com>
)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/fribidi
  patch -Np1 -i ${srcdir}/testrunnerwine.patch
}

build() {
  export NEED_WINE=1
  local meson_options=(
    -D docs=false
  )

  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/fribidi/build-${_arch} && cd ${srcdir}/fribidi/build-${_arch}

    ${_arch}-meson .. --default-library both "${meson_options[@]}"
    meson compile
  done
}

check() {
  export NEED_WINE=1
  for _arch in ${_architectures}; do
    cp ${srcdir}/fribidi/build-${_arch}/lib/*.dll ${srcdir}/fribidi/build-${_arch}/bin/
    cp ${srcdir}/fribidi/build-${_arch}/lib/*.dll ${srcdir}/fribidi/build-${_arch}/test/unicode-conformance/
    WINEDEBUG=-all meson test -C ${srcdir}/fribidi/build-${_arch} --print-errorlogs
  done
}

package() {
  for _arch in ${_architectures}; do
    meson install -C ${srcdir}/fribidi/build-${_arch} --destdir "${pkgdir}"

    #FIXME: Ranlib (isn't meson supposed to do this?)
    ${_arch}-ranlib ${pkgdir}/usr/${_arch}/lib/*.a

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set sw=2 sts=-1 et:
