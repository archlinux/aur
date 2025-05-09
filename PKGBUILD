# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

_reponame=rapidjson
pkgname=mingw-w64-$_reponame
pkgver=1.1.0
pkgrel=8
pkgdesc='A fast JSON parser/generator for C++ with both SAX/DOM style API (mingw-w64)'
arch=('any')
url='https://github.com/miloyip/rapidjson'
license=('MIT')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'ninja' 'git')
checkdepends=('mingw-w64-wine' 'python')
source=(
  "$_reponame-$pkgver.tar.gz::https://github.com/miloyip/$_reponame/archive/v$pkgver.tar.gz"
  'https://github.com/Tencent/rapidjson/commit/3b2441b8.patch'
  'git+https://github.com/google/googletest.git#commit=2fe3bd994b3189899d93f1d5a881e725e046fdc2')
sha512sums=('2e82a4bddcd6c4669541f5945c2d240fb1b4fdd6e239200246d3dd50ce98733f0a4f6d3daa56f865d8c88779c036099c52a9ae85d47ad263686b68a88d832dff'
            '5002ff20a65b7d057411e39adf7f5a29eddff818d20579900b655df4d838b984a1b68f488232e1990b592943a70943619d924da1c4e1d2ce0d3ef65bc40f75d6'
            'bf8e45c38736f83c486e4c7ba0ca67e8be88a3f0c60d05520c4968a5d0c2711b07a06d4b9a73f711d4ff89a0eae9bbe2a5697de7707b2374bc2ff5d12dea3a03')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "$_reponame-$pkgver"

  # disable -Werror as it is done in the regular rapidjson package
  find -name CMakeLists.txt | xargs sed -e 's|-Werror||' -i # Don't use -Werror

  # disable -march=native when compiling with Clang to prevent `clang++: error: unsupported argument 'native' to option '-march='`
  if [[ $pkgname =~ .*-clang-.* ]]; then
    find -name CMakeLists.txt -exec sed -i -e 's|-march=native||' {} \+
  fi

  patch -p1 -i ../3b2441b8.patch # Fix build with GCC 14

  # exclude tests which don't run within WINE
  sed -e 's:\(filestreamtest\|encodedstreamtest\|prettywritertest\|ostreamwrappertest\)\.cpp:#\0:g' -i test/unittest/CMakeLists.txt
}

build () {
  for _arch in ${_architectures}; do
    local arch_flags=()
    [[ $_arch =~ aarch64-.* ]] && arch_flags+=(-Dgtest_disable_pthreads:BOOL=ON)
    ${_arch}-cmake \
        -G Ninja \
        -S "$_reponame-$pkgver" \
        -B "build-${_arch}" \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DRAPIDJSON_HAS_STDSTRING=ON \
        -DRAPIDJSON_BUILD_CXX11=ON \
        -DRAPIDJSON_ENABLE_INSTRUMENTATION_OPT=OFF \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr/${_arch}" \
        -DGTEST_SOURCE_DIR="$srcdir/googletest/googletest" \
        -DGTEST_INCLUDE_DIR="$srcdir/googletest/googletest/include" \
        -DINSTALL_GTEST=OFF \
        -DRAPIDJSON_BUILD_THIRDPARTY_GTEST=ON \
        ${arch_flags[@]}
    [[ $_arch =~ aarch64-.* ]] && sed -i -e 's|-lpthread||g' "build-${_arch}/build.ninja"
    VERBOSE=1 cmake --build "build-${_arch}"
  done
}

check() {
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
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install "build-${_arch}"
    # remove examples
    rm -r "${pkgdir}/usr/${_arch}/share"
    # put cmake files in right directory
    mkdir -p "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
    mv "${pkgdir}/usr/${_arch}/cmake/"* "${pkgdir}/usr/${_arch}/lib/cmake/RapidJSON"
  done
}
