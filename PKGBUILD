pkgname=mingw-w64-gklib
pkgver=5.1.1
pkgrel=3
pkgdesc='A library of various helper routines and frameworks used by many of the labs software (mingw-w64)'
url="https://github.com/KarypisLab/GKlib"
license=('Apache')
depends=('mingw-w64-regex')
makedepends=('mingw-w64-cmake')
arch=('any')
options=('!buildflags' '!strip' 'staticlibs')
_commit=08b72b2c41f0ac2a825438649ee7361bf0b488c3
source=("https://github.com/KarypisLab/GKlib/archive/refs/tags/METIS-v5.1.1-DistDGL-0.5.tar.gz")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/GKlib-METIS-v5.1.1-DistDGL-0.5
  curl -L https://github.com/KarypisLab/GKlib/pull/9.patch | patch -p1
  echo "target_link_libraries(GKlib /usr/\${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32/lib/libregex.a)" >> CMakeLists.txt
  sed -i "s|LIBRARY DESTINATION lib/\${LINSTALL_PATH})|LIBRARY DESTINATION lib/\${LINSTALL_PATH} RUNTIME DESTINATION bin)|g" CMakeLists.txt
  sed -i "s|march=native|march=nocona|g" GKlibSystem.cmake
  sed -i "s|Werror|Wall|g" GKlibSystem.cmake
  sed -i "s|VERSION 2.8|VERSION 3.5|g" CMakeLists.txt
}

build() {
  cd "${srcdir}"/GKlib-METIS-v5.1.1-DistDGL-0.5
  for _arch in ${_architectures}; do
    for _shared in OFF ON; do
      ${_arch}-cmake -B build-${_arch}-${_shared} -DBUILD_SHARED_LIBS=${_shared}
      make -C build-${_arch}-${_shared}
    done
  done
}

package() {
  for _arch in ${_architectures}; do
    for _shared in OFF ON; do
      make install -C GKlib-METIS-v5.1.1-DistDGL-0.5/build-${_arch}-${_shared} DESTDIR="${pkgdir}"
    done
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/include/ms_*
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a  
  done
}
