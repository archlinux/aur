# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

pkgname=mingw-w64-fribidi
pkgver=1.0.13
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64)"
arch=('any')
license=('LGPL')
url="http://fribidi.org"
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'git')
_commit=b54871c339dabb7434718da3fed2fa63320997e5  # tags/v1.0.13^0
source=("git+https://github.com/fribidi/fribidi#commit=$_commit"
        "testrunnerwine.patch")
b2sums=('SKIP'
        'b4a3a06cfbedf92959b2d5ceb7714957c7f42cd9b7bb02cebcf867c929cdc2922f836310e3464e10bbc89f6788ea9bbaf2f20914db78db7169801cffdffd98af')
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
