# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libass
pkgver=0.12.2
pkgrel=1
pkgdesc="A portable library for SSA/ASS subtitles rendering (mingw-w64)"
arch=('any')
url="https://github.com/libass/libass/"
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-fribidi' 'mingw-w64-fontconfig' 'mingw-w64-enca')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-configure' 'yasm')
source=("${url}/releases/download/${pkgver}/libass-${pkgver}.tar.xz")
md5sums=('d4b78e6a0794a9d386ece5cd08eb2d3e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libass-$pkgver/build-${_arch} && cd ${srcdir}/libass-$pkgver/build-${_arch}

    unset LDFLAGS CPPFLAGS
    #${srcdir}/libass-${pkgver}/configure \
    #--host=${_arch} \
    #--prefix=/usr/${_arch} \
    ${_arch}-configure \
    --enable-enca \
    --enable-harfbuzz \
    --enable-fontconfig

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libass-$pkgver/build-${_arch}

    make DESTDIR="${pkgdir}" install
    #install -D -m644 ${srcdir}/libass-${pkgver}/COPYING "${pkgdir}/usr/${_arch}/share/licenses/libass/LICENSE"
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
