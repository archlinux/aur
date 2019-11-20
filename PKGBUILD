# Maintainer: edubart <edub4rt@gmail.com>
_basename=jemalloc
pkgname=mingw-w64-jemalloc
pkgver=5.2.1
pkgrel=1
pkgdesc='General-purpose scalable concurrent malloc implementation (mingw-w64)'
arch=('i686' 'x86_64')
license=('BSD')
url='http://www.canonware.com/jemalloc/'
options=(staticlibs !strip !buildflags)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${_basename}-${pkgver}.tar.bz2")
sha256sums=('34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  cd $_basename-$pkgver
  export CFLAGS="$CFLAGS -g1"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    cd build-${_arch}
    ${_arch}-configure --enable-xmalloc --prefix="/usr/${_arch}" --with-jemalloc-prefix=""
    make
    cd ..
  done
}

package() {
  cd $_basename-$pkgver
  for _arch in ${_architectures}; do
    cd build-${_arch}
    make DESTDIR="$pkgdir" install_include install_lib
    mv $pkgdir/usr/${_arch}/lib/jemalloc.lib $pkgdir/usr/${_arch}/lib/libjemalloc.a
    mv $pkgdir/usr/${_arch}/lib/jemalloc_s.lib $pkgdir/usr/${_arch}/lib/libjemalloc_s.a
    cd ..
  done
  find "$pkgdir" -name '*.a' -type f -exec chmod 644 {} \;
}
