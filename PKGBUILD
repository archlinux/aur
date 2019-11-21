# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

_reponame=rapidjson
pkgname=mingw-w64-$_reponame
pkgver=1.1.0
pkgrel=3
pkgdesc='A fast JSON parser/generator for C++ with both SAX/DOM style API (mingw-w64)'
arch=('any')
url='https://github.com/miloyip/rapidjson'
license=('MIT')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
checkdepends=('mingw-w64-wine' 'mingw-w64-gtest' 'gtest' 'python')
source=($_reponame-$pkgver.tar.gz::https://github.com/miloyip/$_reponame/archive/v$pkgver.tar.gz)
md5sums=('badd12c511e081fec6c89c43a7027bce')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "$_reponame-$pkgver"

  # disable -Werror as it is done in the regular rapidjson package
  find -name CMakeLists.txt | xargs sed -e 's|-Werror||' -i # Don't use -Werror

  # exclude tests which don't run within WINE
  sed -e 's:\(filestreamtest\|encodedstreamtest\|prettywritertest\|ostreamwrappertest\)\.cpp:#\0:g' -i test/unittest/CMakeLists.txt
}

build () {
  cd "$_reponame-$pkgver"

  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DRAPIDJSON_HAS_STDSTRING=ON \
        -DRAPIDJSON_BUILD_CXX11=ON \
        -DRAPIDJSON_ENABLE_INSTRUMENTATION_OPT=OFF \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr/${_arch}" \
        -DGTEST_SOURCE_DIR=/usr/src/gtest \
        ..
    make
    popd
  done
}

check() {
  cd "$_reponame-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    pushd bin
    ln -s unittest.exe unittest
    ln -s perftest.exe perftest
    popd

    WINEPATH="/usr/${_arch}/bin" ctest -j 2 -V --tests-regex '^(perftest|unittest)$'
    # note: Not running valgrind tests here; valgrind can not execute Windows executable.
    popd
  done
}

package() {
  cd "$_reponame-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install
    # remove examples
    rm -r "${pkgdir}/usr/${_arch}/share"
    # put cmake files in right directory
    mkdir -p "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    mv "${pkgdir}/usr/${_arch}/cmake/"* "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    popd
  done
}
