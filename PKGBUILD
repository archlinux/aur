# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=mingw-w64-libssh
pkgver=0.6.4
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries (mingw-w64)"
url="http://www.libssh.org/"
license=('LGPL')
arch=('any')
depends=('mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-pkg-config' 'doxygen')
options=(!strip !buildflags staticlibs)
#cmocka
#checkdepends=('openssh')
source=(https://red.libssh.org/attachments/download/107/libssh-${pkgver}.tar.gz
        https://red.libssh.org/attachments/download/108/libssh-${pkgver}.tar.asc
        mingw-w64-pthreads.patch
        mingw-as-unix.patch
        mingw-DATADIR-conflict.patch)
md5sums=('8a7daa171c69913f475dacffcb639fda'
         'SKIP'
         'ca268e1366633f988e21cbcf5a4d8145'
         'd819f18cb4ae07ad2a6589b02765b6c2'
         '7be13e00d27ce77f862012ee0654019b')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # disable the test. It is confused by our clean container setup.
  # 'extra-x86-build' uses user 'nobody' that has a record in /etc/passwd file
  # but $HOME envvar is set to '/build'. The test expects that $HOME corresponds to passwd file.
  sed 's/unit_test(torture_path_expand_tilde_unix),//' -i libssh-${pkgver}/tests/unittests/torture_misc.c

  cd "${srcdir}/libssh-${pkgver}"

  patch -p1 -i ${srcdir}/mingw-w64-pthreads.patch
  patch -p1 -i ${srcdir}/mingw-as-unix.patch
  patch -p1 -i ${srcdir}/mingw-DATADIR-conflict.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    ${_arch}-cmake ../libssh-${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_GSSAPI=OFF \
      -DWITH_STATIC_LIB=ON

      #-DWITH_TESTING=ON
    make
  done
}

#TODO: Test with wine?
#check() {
#  cd build
#  make test
#}

package(){
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    make DESTDIR="${pkgdir}" install
  done
}
