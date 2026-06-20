# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: bubla < matej dot tyc at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libtiff
pkgver=4.7.1
pkgrel=3
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=('any')
url="https://libtiff.gitlab.io/libtiff/"
license=('custom')
depends=(
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-zlib'
  'mingw-w64-xz'
)
makedepends=(
  'git'
  'mingw-w64-cmake'
  'python-sphinx'
)
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.com/libtiff/libtiff.git?signed#tag=v${pkgver}")
b2sums=('28fb783db36e184b578f19d1141c82df46fd60da323b592c73e6da97f3e2dddb5cb38bd2977eb4b93e361a65ee116cd249e980cebfd558d4d57182d1c8f8b3a9')
validpgpkeys=(
  'EBDFDB21B020EE8FD151A88DE301047DE1198975' # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
  'B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D' # Even Rouault <even.rouault@spatialys.com>
)

prepare() {
  cd "${srcdir}/libtiff"
  # keep original libtiff-6.dll runtime name
  echo 'set_target_properties(tiff PROPERTIES RUNTIME_OUTPUT_NAME tiff-6 PREFIX "lib")' >> CMakeLists.txt
  # keep original libtiffxx-6.dll runtime name
  echo 'set_target_properties(tiffxx PROPERTIES RUNTIME_OUTPUT_NAME tiffxx-6 PREFIX "lib")' >> CMakeLists.txt
} 

build() {
  export CFLAGS="-fno-strict-aliasing"
  export CXXFLAGS="-fno-strict-aliasing"
  cd "${srcdir}/libtiff"
  for _arch in ${_architectures}; do
    # shared
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -Dtiff-contrib:BOOL=OFF \
      -Dtiff-docs:BOOL=OFF \
      -Dtiff-tests:BOOL=OFF \
      -Dtiff-tools:BOOL=OFF \
      -B build-${_arch}-shared -S .
    make -C build-${_arch}-shared
    # static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static" \
      -Dtiff-contrib:BOOL=OFF \
      -Dtiff-docs:BOOL=OFF \
      -Dtiff-tests:BOOL=OFF \
      -Dtiff-tools:BOOL=OFF \
      -B build-${_arch}-static -S .
    make -C build-${_arch}-static
  done
}

package() {
  cd "${srcdir}/libtiff"
  for _arch in ${_architectures}; do
    make DESTDIR=${pkgdir} install -C build-${_arch}-static
    make DESTDIR=${pkgdir} install -C build-${_arch}-shared
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
