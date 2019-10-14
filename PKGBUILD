# Maintainer: osfans <waxaca@163.com>

_pkgname=leveldb
pkgname=mingw-w64-${_pkgname}
pkgver=1.22
pkgrel=1
pkgdesc="A fast and lightweight key/value database library (mingw-w64)"
arch=(any)
url="https://github.com/google/leveldb"
license=('BSD')
depends=('mingw-w64-snappy')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google/leveldb/archive/$pkgver.tar.gz")
sha1sums=('8d310af5cfb53dc836bfb412ff4b3c8aea578627')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_shared_libs="OFF ON"


build() {
  cd "$_pkgname-$pkgver"
  for _arch in ${_architectures}; do
    for _lib in ${_shared_libs}; do
      ${_arch}-cmake -Bbuild-${_arch}-${_lib} -DBUILD_SHARED_LIBS:BOOL=${_lib} -DLEVELDB_BUILD_TESTS:BOOL=OFF -DLEVELDB_BUILD_BENCHMARKS:BOOL=OFF -H.
      make -C build-${_arch}-${_lib}
    done
  done
}

package() {
  cd "$_pkgname-$pkgver"

  for _arch in ${_architectures}; do
    for _lib in ${_shared_libs}; do
      make -C build-${_arch}-${_lib} DESTDIR="$pkgdir" install
    done

    # license
    install -Dm644 LICENSE "$pkgdir/usr/${_arch}/share/licenses/$_pkgname/LICENSE"
  done
}
