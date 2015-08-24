# Maintainer: Jens Staal <staal1978@gmail.com>
# adopted from libxcb-git package:
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: NeoRaider <neoraider@universe-factory.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mingw-w64-libxcb
pkgver=1.11.r59.g4033d39
pkgrel=1
pkgdesc="X11 client-side library on top of Win32 - git version (mingw-w64)"
arch=('any')
url="http://xcb.freedesktop.org/win32port/"
depends=('mingw-w64-crt' 'mingw-w64-libxau' 'mingw-w64-winpthreads' \
'mingw-w64-libxdmcp' 'mingw-w64-xcb-proto')
makedepends=('git' 'mingw-w64-libxslt' 'python' 'mingw-w64-xorg-util-macros')
provides=("mingw-w64-libxcb-win32-git=$pkgver")
license=('custom')
source=('xcb-win32'::'git+http://anongit.freedesktop.org/git/xcb/libxcb.git')
sha256sums=('SKIP')
options=('!strip' 'staticlibs' '!buildflags')
            
_architectures="i686-w64-mingw32" 
# x86_64-w64-mingw32 build errors in libxdmcp dependency - conflicting types

pkgver() {
  cd "${srcdir}"/xcb-win32
  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare() {
  cd "${srcdir}"/xcb-win32
  sed 's|pthread-stubs xau >=|xau >=|g' -i configure.ac
}

build() {

  export LC_ALL="C"
  cd "${srcdir}"/xcb-win32 

  #generic, to make configure
    ./autogen.sh \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    --enable-xinput \
    --enable-xkb
  
  make distclean
  
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    export CFLAGS="-O2 -g -pipe -Wno-error -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    export CXXFLAGS=$CFLAGS
    export BASE_CFLAGS="-Wno-error"
    export LDFLAGS="$LDFLAGS -lssp -lws2_32 -lwinpthread"  
    ${_arch}-configure
    make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" BASE_CFLAGS="$BASE_CFLAGS"
    popd
  done
}

package() {
  cd "${srcdir}"/xcb-win32
 for _arch in ${_architectures}; do
    cd "${srcdir}/xcb-win32/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -f "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
# vim:set ts=2 sw=2 bs=2:
