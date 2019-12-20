pkgname=mingw-w64-openal
pkgver=1.20.0
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (mingw-w64)"
arch=(any)
url="https://github.com/kcat/openal-soft"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://github.com/kcat/openal-soft/archive/openal-soft-1.20.0.tar.gz")
sha256sums=('ea1582337ce0344754cc6742b9a5da248fb971fb6fbcc592f843f765423d9265')

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
