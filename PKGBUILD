# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=mingw-w64-libssh
pkgver=0.9.5
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries (mingw-w64)"
url="https://www.libssh.org/"
license=('LGPL')
arch=('any')
depends=('mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-pkg-config' 'mingw-w64-wine' 'mingw-w64-cmocka' 'doxygen' 'python')
options=(!strip !buildflags staticlibs)
#cmocka
source=(https://www.libssh.org/files/${pkgver%.*}/libssh-$pkgver.tar.xz{,.asc}
        mingw-pkgconfig.patch
        staticlibfix.patch)
sha256sums=('acffef2da98e761fc1fd9c4fddde0f3af60ab44c4f5af05cd1b2d60a3fa08718'
            'SKIP'
            '10e57a3c226374b42656a11411fb8803a6afc9f76a3b71ca72649a1c9c1b10d1'
            'befd0650f7f6fd1d92872b8e2676a201b1449b009706de7fdbdd400b716fddf8')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # disable the test. It is confused by our clean container setup.
  # 'extra-x86-build' uses user 'nobody' that has a record in /etc/passwd file
  # but $HOME envvar is set to '/build'. The test expects that $HOME corresponds to passwd file.
  sed 's/cmocka_unit_test(torture_path_expand_tilde_unix),//' -i libssh-${pkgver}/tests/unittests/torture_misc.c
  sed 's/\${TARGET_SYSTEM_EMULATOR}/\${CMAKE_CROSSCOMPILING_EMULATOR}/' -i libssh-${pkgver}/cmake/Modules/AddCMockaTest.cmake
  # Disable automatic detection of openssl since it picks up openssl-1.0
  sed 's/find_package(OpenSSL)/#find_package(OpenSSL)/' -i libssh-${pkgver}/CMakeLists.txt

  cd "${srcdir}/libssh-${pkgver}"

  patch -p1 -i ${srcdir}/mingw-pkgconfig.patch

  # Should be included in next release:
  # https://bugs.libssh.org/T198
  # https://gitlab.com/libssh/libssh-mirror/merge_requests/73/diffs
  patch -p1 -i ${srcdir}/staticlibfix.patch
}

build() {
  #static build
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch}-static && cd "${srcdir}"/build-${_arch}-static

    version=$(cat /usr/${_arch}/include/openssl/opensslv.h | grep "OPENSSL_VERSION_TEXT" | sed 's/^[^\"]*"OpenSSL //' | sed 's/ .*$//')
    libssl=$(ls /usr/${_arch}/bin/libssl-*.dll)
    libcrypto=$(ls /usr/${_arch}/bin/libcrypto-*.dll)

    ${_arch}-cmake ../libssh-${pkgver} \
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

    make
  done

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    version=$(cat /usr/${_arch}/include/openssl/opensslv.h | grep "OPENSSL_VERSION_TEXT" | sed 's/^[^\"]*"OpenSSL //' | sed 's/ .*$//')
    libssl=$(ls /usr/${_arch}/bin/libssl-*.dll)
    libcrypto=$(ls /usr/${_arch}/bin/libcrypto-*.dll)

    ${_arch}-cmake ../libssh-${pkgver} \
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

    make
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    WINEDEBUG=-all make test
  done
}

package(){
  # install static library
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}-static

    make DESTDIR="${pkgdir}" install
  done

  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    make DESTDIR="${pkgdir}" install

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
