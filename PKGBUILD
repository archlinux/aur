# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=mingw-w64-libssh
pkgver=0.10.6
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries (mingw-w64)"
url="https://www.libssh.org/"
license=('LGPL')
arch=('any')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-pkg-config' 'mingw-w64-wine' 'mingw-w64-cmocka' 'doxygen' 'python')
options=(!strip !buildflags staticlibs)
#cmocka
source=(https://www.libssh.org/files/${pkgver%.*}/libssh-$pkgver.tar.xz{,.asc})
sha256sums=('1861d498f5b6f1741b6abc73e608478491edcf9c9d4b6630eef6e74596de9dc1'
            'SKIP')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  sed 's/\${TARGET_SYSTEM_EMULATOR}/\${CMAKE_CROSSCOMPILING_EMULATOR}/' -i libssh-${pkgver}/cmake/Modules/AddCMockaTest.cmake
  # Disable automatic detection of openssl since it picks up openssl-1.0
  sed 's/find_package(OpenSSL)/#find_package(OpenSSL)/' -i libssh-${pkgver}/CMakeLists.txt
}

build() {
  #static build
  for _arch in ${_architectures}; do
    version=$(cat /usr/${_arch}/include/openssl/opensslv.h | grep "OPENSSL_VERSION_TEXT" | sed 's/^[^\"]*"OpenSSL //' | sed 's/ .*$//')
    libssl=$(ls /usr/${_arch}/bin/libssl-*.dll)
    libcrypto=$(ls /usr/${_arch}/bin/libcrypto-*.dll)

    ${_arch}-cmake -B "${srcdir}"/build-${_arch}-static \
      -S libssh-${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_GSSAPI=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_STATIC_LIB:BOOL=ON \
      -DOPENSSL_FOUND:BOOL=ON \
      -DOPENSSL_INCLUDE_DIR:FILEPATH=/usr/${_arch}/include/ \
      -DOPENSSL_SSL_LIBRARY:FILEPATH="$libssl" \
      -DOPENSSL_CRYPTO_LIBRARY:FILEPATH="$libcrypto" \
      -DOPENSSL_VERSION:STRING="$version" \
      -DUNIT_TESTING=OFF \
      -DWITH_EXAMPLES=OFF

    #${_arch}-cmake --build "${srcdir}"/build-${_arch}-static
    make -C "${srcdir}"/build-${_arch}-static
  done

  for _arch in ${_architectures}; do
    version=$(cat /usr/${_arch}/include/openssl/opensslv.h | grep "OPENSSL_VERSION_TEXT" | sed 's/^[^\"]*"OpenSSL //' | sed 's/ .*$//')
    libssl=$(ls /usr/${_arch}/bin/libssl-*.dll)
    libcrypto=$(ls /usr/${_arch}/bin/libcrypto-*.dll)

    ${_arch}-cmake -B "${srcdir}"/build-${_arch} \
      -S libssh-${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_GSSAPI=OFF \
      -DWITH_STATIC_LIB=ON \
      -DOPENSSL_FOUND:BOOL=ON \
      -DOPENSSL_INCLUDE_DIR:FILEPATH=/usr/${_arch}/include/ \
      -DOPENSSL_SSL_LIBRARY:FILEPATH="$libssl" \
      -DOPENSSL_CRYPTO_LIBRARY:FILEPATH="$libcrypto" \
      -DOPENSSL_VERSION:STRING="$version" \
      -DUNIT_TESTING=ON

    #${_arch}-cmake --build "${srcdir}"/build-${_arch}
    make -C "${srcdir}"/build-${_arch}
  done
}

check() {
  for _arch in ${_architectures}; do
    #WINEDEBUG=-all ${_arch}-cmake --build "${srcdir}"/build-${_arch} --target test
    WINEDEBUG=-all make -C "${srcdir}"/build-${_arch} test
  done
}

package(){
  # install static library
  for _arch in ${_architectures}; do
    #DESTDIR="${pkgdir}" ${_arch}-cmake --install "${srcdir}"/build-${_arch}-static
    make DESTDIR="${pkgdir}" -C "${srcdir}"/build-${_arch}-static install
  done

  for _arch in ${_architectures}; do
    #DESTDIR="${pkgdir}" ${_arch}-cmake --install "${srcdir}"/build-${_arch}
    make DESTDIR="${pkgdir}" -C "${srcdir}"/build-${_arch} install

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
