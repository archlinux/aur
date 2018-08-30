# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=mingw-w64-libssh
pkgver=0.8.2
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries (mingw-w64)"
url="http://www.libssh.org/"
license=('LGPL')
arch=('any')
depends=('mingw-w64-libgcrypt' 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-pkg-config' 'mingw-w64-wine' 'mingw-w64-cmocka' 'doxygen' 'python')
options=(!strip !buildflags staticlibs)
#cmocka
source=(https://www.libssh.org/files/${pkgver%.*}/libssh-$pkgver.tar.xz{,.asc}
        mingw-as-unix.patch
        mingw-DATADIR-conflict.patch
        mingw-pkgconfig.patch)
sha256sums=('8d1290f0fac4f8a75a9001dd404a8a093daba4e86c90c45ecf77d62f14c7b8a5'
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

  cd "${srcdir}/libssh-${pkgver}"

  patch -p1 -i ${srcdir}/mingw-as-unix.patch
  patch -p1 -i ${srcdir}/mingw-DATADIR-conflict.patch
  patch -p1 -i ${srcdir}/mingw-pkgconfig.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    ${_arch}-cmake ../libssh-${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_GSSAPI=OFF \
      -DWITH_GCRYPT=ON \
      -DWITH_STATIC_LIB=ON \
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
