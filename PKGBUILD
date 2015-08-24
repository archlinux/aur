# Maintainer Jens Staal <staal1978@gmial.com>
# adopted from official xcb-proto package:
# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xcb-proto
pkgver=1.11.r95.g6b832a0
pkgrel=1
pkgdesc="XML-XCB protocol descriptions (mingw-w64)"
arch=(any)
url="http://xcb.freedesktop.org/"
license=('custom')
makedepends=('python' 'libxml2' 'git')
source=("xcb-proto::git://git.freedesktop.org/git/xcb/proto")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/xcb-proto"
  git describe --long | sed 's/-/.r/;s/-/./g'
}

_architectures="i686-w64-mingw32 x86_64-w64-mingw32" 

build() {
  cd xcb-proto
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
  cd xcb-proto
  for _arch in ${_architectures}; do
    cd "${srcdir}/xcb-proto/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
