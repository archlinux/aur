# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

_reponame=rapidjson
pkgname=mingw-w64-$_reponame
pkgver=1.1.0
pkgrel=6
pkgdesc='A fast JSON parser/generator for C++ with both SAX/DOM style API (mingw-w64)'
arch=('any')
url='https://github.com/miloyip/rapidjson'
license=('MIT')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'ninja' 'git')
checkdepends=('mingw-w64-wine' 'python')
source=(
	"$_reponame-$pkgver.tar.gz::https://github.com/miloyip/$_reponame/archive/v$pkgver.tar.gz"
	'git+https://github.com/google/googletest.git#commit=2fe3bd994b3189899d93f1d5a881e725e046fdc2')
sha256sums=('bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e'
            'SKIP')
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
        -G Ninja \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DRAPIDJSON_HAS_STDSTRING=ON \
        -DRAPIDJSON_BUILD_CXX11=ON \
        -DRAPIDJSON_ENABLE_INSTRUMENTATION_OPT=OFF \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr/${_arch}" \
        -DGTEST_SOURCE_DIR="$srcdir/googletest/googletest" \
        -DGTEST_INCLUDE_DIR="$srcdir/googletest/googletest/include" \
        -DINSTALL_GTEST=OFF \
        -DRAPIDJSON_BUILD_THIRDPARTY_GTEST=ON \
        ..
    ninja
    popd
  done
}

check() {
  cd "$_reponame-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    pushd bin
    ln -sf unittest.exe unittest
    ln -sf perftest.exe perftest
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
    DESTDIR="${pkgdir}" ninja install
    # remove examples
    rm -r "${pkgdir}/usr/${_arch}/share"
    # put cmake files in right directory
    mkdir -p "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    mv "${pkgdir}/usr/${_arch}/cmake/"* "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    popd
  done
}
