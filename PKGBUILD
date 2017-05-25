# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Alexey Pavlov <alexpux@gmail.com>

pkgname=mingw-w64-libssh
pkgver=0.7.5
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries (mingw-w64)"
url="http://www.libssh.org/"
license=('LGPL')
arch=('any')
depends=('mingw-w64-libgcrypt' 'mingw-w64-zlib') # use openssl again for 0.8
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-pkg-config' 'doxygen')
options=(!strip !buildflags staticlibs)
#cmocka
source=(https://red.libssh.org/attachments/download/218/libssh-$pkgver.tar.xz
        https://red.libssh.org/attachments/download/217/libssh-$pkgver.tar.asc
        mingw-as-unix.patch
        mingw-DATADIR-conflict.patch
        mingw-pkgconfig.patch)
sha256sums=('54e86dd5dc20e5367e58f3caab337ce37675f863f80df85b6b1614966a337095'
            'SKIP'
            '89d8b663f0a9403f64998057e24dbdb46cd85be51bf2b97bc4c2e69bc231d7e8'
            '444a66b1926f49c54df844c22263496c2d86e124c8bcdbd194c4581d06140c1b'
            '00b0f061b49d1268dd738910c6663870061d2244e9ed2424b03ea6c396274dc4')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # disable the test. It is confused by our clean container setup.
  # 'extra-x86-build' uses user 'nobody' that has a record in /etc/passwd file
  # but $HOME envvar is set to '/build'. The test expects that $HOME corresponds to passwd file.
  sed 's/unit_test(torture_path_expand_tilde_unix),//' -i libssh-${pkgver}/tests/unittests/torture_misc.c

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

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
