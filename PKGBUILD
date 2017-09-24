# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=shaderc-git
pkgver=r414.eadd549
pkgrel=1
pkgdesc="A collection of tools, libraries and tests for shader compilation"
url="https://github.com/google/shaderc"
license=("Apache")

arch=("x86_64")
makedepends=("ninja" "cmake" "python")
depends=("gcc-libs")
conflicts=("shaderc")
provides=("shaderc" "glslc")

source=("shaderc::git+https://github.com/google/shaderc"
        "googletest::git+https://github.com/google/googletest.git"
        "glslang::git+https://github.com/google/glslang.git"
        "spirv-tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git"
        "spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git")

sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$srcdir/shaderc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/shaderc"
  ln -s -f "$srcdir/googletest" third_party/
  ln -s -f "$srcdir/glslang" third_party/
  ln -s -f "$srcdir/spirv-tools" third_party/
  ln -s -f "$srcdir/spirv-headers" third_party/spirv-tools/external/
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "$srcdir/shaderc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DSHADERC_SKIP_TESTS=on \
    -DSKIP_GLSLANG_INSTALL=on \
    -DSKIP_SPIRV_TOOLS_INSTALL=on \
    -DSKIP_GOOGLETEST_INSTALL=on \
    -GNinja

  ninja
}

package() {
  cd "$srcdir/build"

  ninja install
}
