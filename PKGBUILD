# Maintainer: osfans <waxaca@163.com>
_pkgname=uchardet
pkgname=mingw-w64-${_pkgname}-git
pkgver=r191.e6be228
pkgrel=1
pkgdesc="Encoding detector library ported from Mozilla (mingw-w64)"
arch=(any)
url="https://github.com/BYVoid/uchardet"
license=('MPL')
makedepends=('git' 'mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
source=('uchardet::git+https://github.com/BYVoid/uchardet.git')
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  #unset LDFLAGS
  cd "$srcdir/$_pkgname"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -Bbuild-${_arch} -H.
    make -Cbuild-${_arch}
  done
}

package() {
  cd "$srcdir/$_pkgname"
  for _arch in ${_architectures}; do
    make -Cbuild-${_arch} DESTDIR="$pkgdir" install
    ln -s libuchardet.dll $pkgdir/usr/${_arch}/bin/uchardet.dll
  done
}
