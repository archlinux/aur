# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor:  Jens Staal <staal1978@gmial.com>
# adopted from official xcb-proto package:
# $Id$
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
_pkgname=xcb-proto
pkgname=mingw-w64-xcb-proto
pkgver=1.15.2
pkgrel=1
pkgdesc="XML-XCB protocol descriptions (mingw-w64)"
arch=(any)
url="https://xcb.freedesktop.org/"
license=('custom')
makedepends=('python' 'mingw-w64-libxml2')
source=(https://xorg.freedesktop.org/archive/individual/proto/$_pkgname-$pkgver.tar.xz{,.sig}
0001_xcb-proto_revert_datarootdir.patch::https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/d849b9534a52b0199f26c1dd30ac11aba12db9dc.patch)
sha512sums=('9d0b2f0a4dbbf2d64e32ff4658d1663e13d7e5f1bffc1e8d45be7b9dd5bab46e29fc1c2f6e66a7a569e374ba6756faf3c39b0b5e5560df6d7f8b68beec97659d'
            'SKIP'
'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname-$pkgver
  # revert pkgfile back to /usr/lib
  patch -Rp1 -i ../0001_xcb-proto_revert_datarootdir.patch
  autoreconf -vfi
}

build() {
  cd $_pkgname-$pkgver
  ./autogen.sh
  make distclean
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make 
    popd 
  done
}

package() {
 cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    cd "${srcdir}/$_pkgname-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
