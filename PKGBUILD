pkgname=mingw-w64-openal
pkgver=1.20.1
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (mingw-w64)"
arch=(any)
url="https://github.com/kcat/openal-soft"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://github.com/kcat/openal-soft/archive/openal-soft-$pkgver.tar.gz")
sha256sums=('c32d10473457a8b545aab50070fe84be2b5b041e1f2099012777ee6be0057c13')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/openal-soft-openal-soft-$pkgver"

  # static
  for _arch in ${_architectures}; do
    mkdir -p build-static-${_arch} && pushd build-static-${_arch}
    ${_arch}-cmake -DALSOFT_EXAMPLES=OFF -DALSOFT_TESTS=OFF -DALSOFT_UTILS=OFF -DCMAKE_BUILD_TYPE=Release -DLIBTYPE=STATIC ..
    make
    popd
  done

  # shared
  for _arch in ${_architectures}; do
    mkdir -p build-shared-${_arch} && pushd build-shared-${_arch}
    ${_arch}-cmake -DALSOFT_EXAMPLES=OFF -DALSOFT_TESTS=OFF -DALSOFT_UTILS=OFF -DCMAKE_BUILD_TYPE=Release -DLIBTYPE=SHARED ..
    make
    popd
  done
}

package() {
  # static
  for _arch in ${_architectures}; do
    cd "${srcdir}/openal-soft-openal-soft-$pkgver/build-static-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

  # shared
  for _arch in ${_architectures}; do
    cd "${srcdir}/openal-soft-openal-soft-$pkgver/build-shared-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
