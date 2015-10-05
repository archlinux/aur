# $Id: PKGBUILD 240272 2015-06-03 04:47:58Z bisson $
# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Anatol Pomozov
# Contributor: JSpaces <jspace -aT- unseen -d0T- is>
# Contributor: Triode <triode1 -aT- btinternet -d0t- com>

pkgname=mingw-w64-libsoxr
pkgver=0.1.2
pkgrel=1
pkgdesc='The SoX Resampler library that aims to give fast and high quality results for any constant resampling ratio (mingw-w64)'
arch=('any') 
url='http://sourceforge.net/p/soxr/wiki/Home/'
license=(GPL)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(!emptydirs !strip !buildflags staticlibs)
source=(http://downloads.sourceforge.net/project/soxr/soxr-$pkgver-Source.tar.xz
        tests_executable_suffix.patch)
sha1sums=('3b990f91dc8dc08e70626cd5fb90deda0239c211'
          'c86f3421065b6110244fd11e9a9e52774670ee67')
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
    ${_arch}-cmake \
      -DBUILD_EXAMPLES=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DVISIBILITY_HIDDENL=ON \
      -DWITH_AVFFT=ON \
      -DWITH_DOUBLE_PRECISION=ON \
      -DWITH_LSR_BINDINGS=ON \
      -DWITH_OPENMP=ON \
      -DWITH_PFFFT=ON \
      -DWITH_SIMD=ON \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE=0 \
      -DBUILD_TESTS=OFF \
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
  
    make DESTDIR="$pkgdir" install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a

    rm -r ${pkgdir}/usr/${_arch}/doc
  done
}
