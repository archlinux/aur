# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-openh264
pkgver=1.7.0
pkgrel=1
pkgdesc="OpenH264 is a codec library which supports H.264 encoding and decoding (mingw-w64)"
arch=(any)
url="http://www.openh264.org/"
license=("BSD")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'nasm' 'git')
options=(!strip !buildflags staticlibs)
source=("https://github.com/cisco/openh264/archive/v${pkgver}.tar.gz")
sha256sums=('9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS=${CFLAGS}
  for _arch in ${_architectures}; do
    [[ -d "build-${_arch}" ]] && rm -rf "build-${_arch}"
    cp -rf "$srcdir/openh264-${pkgver}" "${srcdir}/build-${_arch}"

    pushd build-${_arch}	
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="i686"
    else
      _targetarch="x86_64"
    fi
    make OS=mingw_nt ARCH=${_targetarch} CC=${_arch}-gcc CXX=${_arch}-g++ AR=${_arch}-ar
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

    make OS=mingw_nt ARCH=${_targetarch} CC=${_arch}-gcc CXX=${_arch}-g++ AR=${_arch}-ar DESTDIR="${pkgdir}" PREFIX="/usr/${_arch}" install
 
    install -Dm755 h264dec.exe "$pkgdir"/usr/${_arch}/bin/h264dec.exe
    install -Dm755 h264enc.exe "$pkgdir"/usr/${_arch}/bin/h264enc.exe

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}

# vim: ts=2 sw=2 et:
