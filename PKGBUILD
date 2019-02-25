# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=mingw-w64-libssh
pkgver=0.8.7
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
        mingw-as-unix.patch
        mingw-DATADIR-conflict.patch
        mingw-pkgconfig.patch)
sha256sums=('43304ca22f0ba0b654e14b574a39816bc70212fdea5858a6637cc26cade3d592'
            'SKIP'
            '41df4db83fd2590591aa4e1d78b685084eb53b033e0b2d84131ffa85b35e7e2d'
            'abb368517ec909bfa785cb9580e9d77cbdcc0d7f36f8889582dfaab3cd6ad1ba'
            '10e57a3c226374b42656a11411fb8803a6afc9f76a3b71ca72649a1c9c1b10d1')
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

  patch -p1 -i ${srcdir}/mingw-as-unix.patch
  patch -p1 -i ${srcdir}/mingw-DATADIR-conflict.patch
  patch -p1 -i ${srcdir}/mingw-pkgconfig.patch
}

build() {
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

#TODO: Test with wine?
check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    WINEDEBUG=-all make test
  done
}

package(){
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    make DESTDIR="${pkgdir}" install

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
