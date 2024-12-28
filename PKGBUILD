_pkgname=glog
pkgname=mingw-w64-google-$_pkgname
pkgver=0.7.1
pkgrel=1
pkgdesc="Logging library for C++ (mingw-w64)"
arch=(any)
license=('custom:BSD3')
url='https://github.com/google/glog'
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
sha512sums=('2dabac87d44e4fe58beceb31b22be732b47df84c22f1af8c0e7d0f262de939889de1f16025c1256539f2833ef3393bc92034e983aa2886752bb8705801a68630')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-$_arch && pushd build-$_arch
    $_arch-cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DWITH_PKGCONFIG=ON -DBUILD_SHARED_LIBS=ON ..
    make
    popd
    mkdir -p build-$_arch-static && pushd build-$_arch-static
    $_arch-cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DWITH_PKGCONFIG=ON -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
  done
}

package() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    make DESTDIR="$pkgdir" install -C build-$_arch-static
    make DESTDIR="$pkgdir" install -C build-$_arch
    install -D -m644 COPYING "$pkgdir"/usr/${_arch}/share/licenses/google-$_pkgname/COPYING
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

