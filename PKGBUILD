# $Id: PKGBUILD 240272 2015-06-03 04:47:58Z bisson $
# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: JSpaces <jspace -aT- unseen -d0T- is>
# Contributor: Triode <triode1 -aT- btinternet -d0t- com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-libsoxr
pkgver=0.1.3
pkgrel=1
pkgdesc='The SoX Resampler library that aims to give fast and high quality results for any constant resampling ratio (mingw-w64)'
arch=('any')
url='http://sourceforge.net/p/soxr/wiki/Home/'
license=(GPL)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(!emptydirs !strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/project/soxr/soxr-$pkgver-Source.tar.xz"
        "tests_executable_suffix.patch")
sha1sums=('32ea46b1a8c0c15f835422892d02fce8286aec3c'
          'd60e428c313fcbdc4773afc49b6081b160945875')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd soxr-$pkgver-Source
  patch -p1 < "$srcdir"/tests_executable_suffix.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    #FIXME: Tests are disabled for now. The tests are patched to recognize the
    # .exe suffix but i'm not sure how to nicely tell cmake to run them with
    # wine

    # build shared libs
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE='Release' \
      -DBUILD_EXAMPLES='OFF' \
      -DBUILD_SHARED_LIBS='ON' \
      -DWITH_AVFFT='ON' \
      -DWITH_LSR_BINDINGS='ON' \
      -DWITH_OPENMP='ON' \
      -DWITH_PFFFT='ON' \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE='0' \
      -DBUILD_TESTS='OFF' \
      ${srcdir}/soxr-$pkgver-Source
    make

    # build static libs
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE='Release' \
      -DBUILD_EXAMPLES='OFF' \
      -DBUILD_SHARED_LIBS='OFF' \
      -DWITH_AVFFT='ON' \
      -DWITH_LSR_BINDINGS='ON' \
      -DWITH_OPENMP='ON' \
      -DWITH_PFFFT='ON' \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE='0' \
      -DBUILD_TESTS='OFF' \
      ${srcdir}/soxr-$pkgver-Source
    make
  done
}

#check() {
#  cd soxr-$pkgver-Source
#  make test
#}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    # install shared libs
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE='Release' \
      -DBUILD_EXAMPLES='OFF' \
      -DBUILD_SHARED_LIBS='ON' \
      -DWITH_AVFFT='ON' \
      -DWITH_LSR_BINDINGS='ON' \
      -DWITH_OPENMP='ON' \
      -DWITH_PFFFT='ON' \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE='0' \
      -DBUILD_TESTS='OFF' \
      ${srcdir}/soxr-$pkgver-Source
    make DESTDIR="$pkgdir" install

    # install static libs
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE='Release' \
      -DBUILD_EXAMPLES='OFF' \
      -DBUILD_SHARED_LIBS='OFF' \
      -DWITH_AVFFT='ON' \
      -DWITH_LSR_BINDINGS='ON' \
      -DWITH_OPENMP='ON' \
      -DWITH_PFFFT='ON' \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE='0' \
      -DBUILD_TESTS='OFF' \
      ${srcdir}/soxr-$pkgver-Source
    make DESTDIR="$pkgdir" install

    ${_arch}-strip -x -g "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a

    rm -rf "${pkgdir}"/usr/${_arch}/doc
  done
}

# vim: ts=2 sw=2 et:
