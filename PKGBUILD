# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-librtmp0
pkgver=2.4
pkgrel=1
pkgdesc="Toolkit for RTMP streams (mingw-w64)"
arch=('any')
url='http://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'git')
options=('!strip' '!buildflags' 'staticlibs')
_commit='fa8646daeb19dfd12c181f7d19de708d623704c0'
source=("git://git.ffmpeg.org/rtmpdump#commit=${_commit}"
  '0001-Makefile-allow-to-override-some-parameters.patch')
sha256sums=('SKIP'
  '43ce5f53885e61dab1aeae0f4318b625cb2000f86fc5d53695787470edce3d24')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "rtmpdump"
  patch -Np1 -i "$srcdir/0001-Makefile-allow-to-override-some-parameters.patch" 
}


build() {
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS=${CFLAGS}
  for _arch in ${_architectures}; do
    [[ -d "build-${_arch}" ]] && rm -rf "build-${_arch}"
    cp -rf "$srcdir/rtmpdump" "${srcdir}/build-${_arch}"
  
    pushd build-${_arch}	
    make SYS=mingw prefix="/usr/${_arch}" CRYPTO=OPENSSL XCFLAGS="$CFLAGS" CC=${_arch}-cc LD=${_arch}-ld 
    popd	
  
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make install DESTDIR="${pkgdir}" SYS=mingw prefix="/usr/${_arch}" CRYPTO=OPENSSL XCFLAGS="$CFLAGS" CC=${_arch}-cc LD=${_arch}-ld 

    rm -rf "$pkgdir"/usr/${_arch}/man
    find "$pkgdir"/usr/${_arch}/bin -type l -delete
    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}

# vim: ts=2 sw=2 et:
