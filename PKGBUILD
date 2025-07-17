# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libass
pkgver=0.17.4
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering (mingw-w64)"
arch=('any')
url="https://github.com/libass/libass/"
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-fribidi' 'mingw-w64-fontconfig' 'mingw-w64-freetype2' 'mingw-w64-harfbuzz' 'mingw-w64-libunibreak')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-configure' 'nasm' 'git')
source=(git+https://github.com/libass/libass.git?signed#tag=${pkgver})
validpgpkeys=(
  5458C3100671F252B0F4C7708079D18C21AAAAFF # Oleg Oshmyan (Chortos-2) <chortos@inbox.lv>
  5EE63F2A71BF132CFE3567E1DFFE615F2824C720 # Oneric <oneric@oneric.de>
)
b2sums=('e7790a6318205c8f3383d205acd9befe779014f17ef8d51c37ca19086efba25cf12d22b0af1eeec7e795e9dd824924ebc569ef6c6518276c9dbe10a26337ed27')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd libass
  ./autogen.sh
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libass/build-${_arch} && cd ${srcdir}/libass/build-${_arch}

    ${_arch}-configure \
      --enable-fontconfig \
      --enable-libunibreak
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libass/build-${_arch}

    make DESTDIR="${pkgdir}" install
    #install -D -m644 ${srcdir}/libass/COPYING "${pkgdir}/usr/${_arch}/share/licenses/libass/LICENSE"
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
