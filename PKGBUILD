# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-openh264
pkgver=2.1.0
pkgrel=1
pkgdesc="OpenH264 is a codec library which supports H.264 encoding and decoding (mingw-w64)"
arch=(any)
url="http://www.openh264.org/"
license=("BSD")
depends=('mingw-w64-gcc')
makedepends=('nasm' 'mingw-w64-make')
options=(!strip !buildflags staticlibs)
source=("https://github.com/cisco/openh264/archive/v${pkgver}.tar.gz")
sha256sums=('27f185d478066bad0c8837f4554cd8d69cca1d55d5f3dc6a43a8cef1fe6c005f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  for _arch in ${_architectures}; do
    [[ -d "build-${_arch}" ]] && rm -rf "build-${_arch}"
    cp -rf "$srcdir/openh264-${pkgver}" "${srcdir}/build-${_arch}"

    pushd build-${_arch}	
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="i686"
    else
      _targetarch="x86_64"
    fi
    ${_arch}-make OS=mingw_nt ARCH=${_targetarch}
    popd	
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"

    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="i686"
    else
      _targetarch="x86_64"
    fi

    ${_arch}-make OS=mingw_nt ARCH=${_targetarch} DESTDIR="${pkgdir}" PREFIX="/usr/${_arch}" install
 
    install -Dm755 h264dec.exe "$pkgdir"/usr/${_arch}/bin/h264dec.exe
    install -Dm755 h264enc.exe "$pkgdir"/usr/${_arch}/bin/h264enc.exe

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}

# vim: ts=2 sw=2 et:
