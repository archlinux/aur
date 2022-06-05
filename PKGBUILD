# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-librtmp0
pkgver=2.4+514+c5f04a5
pkgrel=1
pkgdesc="Toolkit for RTMP streams (mingw-w64)"
arch=('any')
url='http://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'git' 'mingw-w64-environment')
options=('!strip' '!buildflags' 'staticlibs')
_commit='c5f04a58fc2aeea6296ca7c44ee4734c18401aa3'
source=("git://git.ffmpeg.org/rtmpdump#commit=${_commit}"
  '0001-Makefile-allow-to-override-some-parameters.patch'
  '0003-Port-to-openssl-1.1.1.patch')
sha256sums=('SKIP'
  '43ce5f53885e61dab1aeae0f4318b625cb2000f86fc5d53695787470edce3d24'
  '79300f9f7502df9e893f6419e2c88eeca3340a2f5ca4c28619096e90d569106f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd rtmpdump

  echo "2.4+$(git rev-list --count ${_commit})+$(git rev-parse --short ${_commit})"
}

prepare() {
  cd "rtmpdump"
  patch -Np1 -i "$srcdir/0001-Makefile-allow-to-override-some-parameters.patch" 
  patch -Np1 -i "$srcdir/0003-Port-to-openssl-1.1.1.patch" 
}

build() {
  for _arch in ${_architectures}; do
    unset CPPFLAGS
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    source mingw-env ${_arch}

    [[ -d "build-${_arch}" ]] && rm -rf "build-${_arch}"
    cp -rf "$srcdir/rtmpdump" "${srcdir}/build-${_arch}"
  
    pushd build-${_arch}	
    make SYS=mingw prefix="/usr/${_arch}" CRYPTO=OPENSSL XCFLAGS="$CFLAGS" XLDFLAGS="$LDFLAGS" CC=${_arch}-cc LD=${_arch}-ld 
    popd	
  
  done
}

package() {
  for _arch in ${_architectures}; do
    unset CPPFLAGS
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    source mingw-env ${_arch}

    cd "${srcdir}/build-${_arch}"
    make -j1 install DESTDIR="${pkgdir}" SYS=mingw prefix="/usr/${_arch}" CRYPTO=OPENSSL XCFLAGS="$CFLAGS" XLDFLAGS="$LDFLAGS" CC=${_arch}-cc LD=${_arch}-ld 

    rm -rf "$pkgdir"/usr/${_arch}/man
    find "$pkgdir"/usr/${_arch}/bin -type l -delete
    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}

# vim: ts=2 sw=2 et:
