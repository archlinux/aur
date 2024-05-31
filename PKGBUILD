# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Bin Jin <bjin@ctrl-d.org>

_pkgname="shaderc"
pkgname="$_pkgname-non-semantic-debug"
pkgver=2024.1
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation - non-semantic debug patch'
url='https://github.com/google/shaderc'
license=('Apache-2.0')
arch=('x86_64')

depends=(
  'glslang'
  'spirv-tools'
)
makedepends=(
  'cmake'
  'ninja'
  'python'
  'spirv-headers'
)

provides=('shaderc-non-semantic-debug')
conflicts=('shaderc-non-semantic-debug')

_hash_patch="306310127492ee017c87a20671a61b68f3e2f523"

_pkgsrc="shaderc-$pkgver"
source=(
  "shaderc-$pkgver.tar.gz"::"https://github.com/google/shaderc/archive/v$pkgver/shaderc-$pkgver.tar.gz"
  "shaderc-changes-${_hash_patch::7}.patch"::"https://github.com/stenzek/duckstation/raw/$_hash_patch/scripts/shaderc-changes.patch"
)
sha256sums=(
  'SKIP'
  '216575bd302a48a083a9864b21bb569be89c00921188fa8f6f2fac8c30189b75'
)

prepare() {
  cd "$_pkgsrc"
  patch -p1 -i "$srcdir/shaderc-changes-${_hash_patch::7}.patch"

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools | cut -d \  -f 2 | sed 's/-.*//')\\n"
"$(pacman -Q glslang | cut -d \  -f 2 | sed 's/-.*//')\\n"
EOF
}

build() {
  _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/shaderc-non-semantic
    -DCMAKE_INSTALL_LIBDIR='.'
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -DSHADERC_SKIP_EXAMPLES=ON
    -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
    -DSHADERC_ENABLE_SHARED_CRT=ON
    -DSHADERC_SKIP_TESTS=ON
    -Dglslang_SOURCE_DIR=/usr/include/glslang
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}