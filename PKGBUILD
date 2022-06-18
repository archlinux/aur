_pkgname=glog
pkgname=mingw-w64-google-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc="Logging library for C++ (mingw-w64)"
arch=(any)
license=('custom:BSD3')
url='https://github.com/google/glog'
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
sha512sums=('fd2c42583d0dd72c790a8cf888f328a64447c5fb9d99b2e2a3833d70c102cb0eb9ae874632c2732424cc86216c8a076a3e24b23a793eaddb5da8a1dc52ba9226')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $_pkgname-$pkgver
  sed -i "s/check_cxx_symbol_exists (snprintf cstdio HAVE_SNPRINTF)/set (HAVE_SNPRINTF 1)/" CMakeLists.txt
  for _arch in ${_architectures}; do
    mkdir -p build-$_arch
    pushd build-$_arch
    $_arch-cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS:BOOL=ON
    make
    popd
    mkdir -p build-$_arch-static
    pushd build-$_arch-static
    $_arch-cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS:BOOL=OFF
    make
    popd
  done
}

package() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    pushd build-$_arch-static
    make DESTDIR="$pkgdir" install
    popd
    pushd build-$_arch
    make DESTDIR="$pkgdir" install
    popd
    install -D -m644 COPYING "$pkgdir"/usr/${_arch}/share/licenses/google-$_pkgname/COPYING
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

