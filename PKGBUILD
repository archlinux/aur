pkgname=mingw-w64-fmilib
pkgver=2.0.3
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard (mingw-w64)"
arch=('any')
url="http://www.jmodelica.org/FMILibrary"
depends=('mingw-w64-crt' 'mingw-w64-expat' 'mingw-w64-minizip')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')
options=('!buildflags' 'staticlibs' '!strip')
license=('BSD')
source=("https://jmodelica.org/FMILibrary/FMILibrary-${pkgver}-src.zip")
sha256sums=('4cc21f9e2c4114a6f4e303f82ca897ec9aa1eb6f7f09fef85979ea5fca309d9a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "$srcdir"/FMILibrary-${pkgver}

  # do not override CMAKE_INSTALL_PREFIX
  sed -i "/CMAKE_INSTALL_PREFIX/d" CMakeLists.txt

  # install doc in /usr/share
  sed -i "s|DESTINATION doc)|DESTINATION share/doc/fmilib)|g" CMakeLists.txt

  # lowercase libshlwapi.a
  sed -i "s|target_link_libraries(fmilib Shlwapi)|target_link_libraries(fmilib shlwapi)|g" CMakeLists.txt
  sed -i "s|target_link_libraries(jmutils Shlwapi)|target_link_libraries(jmutils shlwapi)|g" Config.cmake/jmutil.cmake

  # run exe through wine
  sed -i 's|COMMAND "${COMPRESS_EXECUTABLE}"|COMMAND ${CMAKE_CROSSCOMPILING_EMULATOR} "${COMPRESS_EXECUTABLE}"|g' Config.cmake/runtime_test.cmake

  # link to system libs (zlib, minizip, expat, drop c99snprintf)
  sed -i 's|target_link_libraries(fmilib_shared ${FMILIB_SHARED_SUBLIBS})|target_link_libraries(fmilib_shared ${FMIXML_LIBRARIES} ${FMIZIP_LIBRARIES} ${FMICAPI_LIBRARIES} ${EXPAT_LIBRARY} ${MINIZIP_LIBRARY} ${ZLIB_LIBRARY})|g' CMakeLists.txt
  sed -i 's|target_link_libraries(fmixml ${JMUTIL_LIBRARIES} expat)|target_link_libraries(fmixml ${JMUTIL_LIBRARIES} ${EXPAT_LIBRARY})|g' Config.cmake/fmixml.cmake
  sed -i 's|target_link_libraries(fmizip minizip jmutils)|target_link_libraries(fmizip ${MINIZIP_LIBRARY} jmutils)|g' Config.cmake/fmixml.cmake
  sed -i 's|target_link_libraries(jmutils c99snprintf)|target_link_libraries(jmutils)|g' Config.cmake/fmixml.cmake

  # install dll to /bin
  sed -i 's|RUNTIME DESTINATION lib|RUNTIME DESTINATION bin|g' CMakeLists.txt
}

build() {
  cd "$srcdir"/FMILibrary-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF \
      -DEXPAT_LIBRARY=/usr/${_arch}/lib/libexpat.a \
      -DZLIB_LIBRARY=/usr/${_arch}/lib/libz.a \
      -DMINIZIP_LIBRARY=/usr/${_arch}/lib/libminizip.a \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/FMILibrary-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
