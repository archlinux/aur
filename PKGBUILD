# $Id: PKGBUILD 240272 2015-06-03 04:47:58Z bisson $
# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: JSpaces <jspace -aT- unseen -d0T- is>
# Contributor: Triode <triode1 -aT- btinternet -d0t- com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=mingw-w64-libsoxr
pkgver=0.1.3
pkgrel=2
pkgdesc='The SoX Resampler library that aims to give fast and high quality results for any constant resampling ratio (mingw-w64)'
arch=('any')
url='https://sourceforge.net/p/soxr/wiki/Home/'
license=(
  LGPL-2.1-only
  LicenseRef-soxr
)
depends=(mingw-w64-crt)
makedepends=(
  mingw-w64-cmake
  git
  ninja
)
options=(!emptydirs !strip !buildflags staticlibs !debug)
source=(git+https://github.com/chirlu/soxr.git#tag=${pkgver}
        "tests_executable_suffix.patch")
b2sums=('bb252500db2c2909fecdd1df7ab3c42c8930bd5c4e41734449edef7eaf16787418a6b4377b26051d3bbe74b79264e2a8193cbb1095bf58c665c706e2b265e6ac'
        '6b07d0d4efa20f132132964ed4c03429be7519e2c836f59fb2848f37bd0ce8e3af7d10f1d92a68b4c259242c9c36349252afbe0b748f97373d2763fd34a6fdca')
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

prepare() {
  cd soxr
  patch -p1 < "$srcdir"/tests_executable_suffix.patch
}

build() {
  for _arch in ${_architectures}; do
    #FIXME: Tests are disabled for now. The tests are patched to recognize the
    # .exe suffix but i'm not sure how to nicely tell cmake to run them with
    # wine

    # build shared libs
    ${_arch}-cmake \
      -S "${srcdir}"/soxr \
      -B "${srcdir}"/build-${_arch} \
      -DCMAKE_BUILD_TYPE='Release' \
      -DBUILD_EXAMPLES='OFF' \
      -DBUILD_SHARED_LIBS='ON' \
      -DWITH_AVFFT='ON' \
      -DWITH_LSR_BINDINGS='ON' \
      -DWITH_OPENMP='ON' \
      -DWITH_PFFFT='ON' \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE='0' \
      -DBUILD_TESTS='OFF' \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build "${srcdir}"/build-${_arch}

    # build static libs
    ${_arch}-cmake \
      -S "${srcdir}"/soxr \
      -B "${srcdir}"/build-${_arch}-static \
      -DCMAKE_BUILD_TYPE='Release' \
      -DBUILD_EXAMPLES='OFF' \
      -DBUILD_SHARED_LIBS='OFF' \
      -DWITH_AVFFT='ON' \
      -DWITH_LSR_BINDINGS='ON' \
      -DWITH_OPENMP='ON' \
      -DWITH_PFFFT='ON' \
      -DHAVE_WORDS_BIGENDIAN_EXITCODE='0' \
      -DBUILD_TESTS='OFF' \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build "${srcdir}"/build-${_arch}-static
  done
}

#check() {
#  ctest --test-dir "${srcdir}"/build-${_arch}
#}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    # install shared libs
    make DESTDIR="$pkgdir" install
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/build-${_arch}

    # install static libs
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/build-${_arch}-static

    ${_arch}-strip -x -g "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a

    rm -rf "${pkgdir}"/usr/${_arch}/doc
  done

  install -Dm 644 "${srcdir}/soxr/LICENCE" -t "${pkgdir}"/usr/share/licenses/mingw-w64-libsoxr/
}

# vim: ts=2 sw=2 et:
