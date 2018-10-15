pkgname=mingw-w64-openal
pkgver=1.19.1
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (mingw-w64)"
arch=(any)
url="https://github.com/kcat/openal-soft"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
_commit=6761218e51699f46bf25c377e65b3e9ea5e434b9  # tags/openal-soft-1.19.1
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/openal-soft"

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
    cd "${srcdir}/openal-soft/build-static-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

  # shared
  for _arch in ${_architectures}; do
    cd "${srcdir}/openal-soft/build-shared-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}

