# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Bin Jin <bjin@ctrl-d.org>

pkgname=shaderc
pkgver=2018.0
pkgrel=1
pkgdesc='A collection of tools, libraries and tests for shader compilation'
arch=('x86_64')
url=https://github.com/google/shaderc
license=('Apache')
depends=('gcc-libs')
makedepends=('asciidoctor' 'cmake' 'ninja' 'python2')
source=("shaderc-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "glslang::git+https://github.com/google/glslang.git"
        "spirv-tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git"
        "spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git")
sha512sums=('7a420fde73c9f2aae3f13558d538a1f4ae43bba19e2b4d2da8fbbd017e9e4f328ece5f330f1bbcb9fe84c91b7eb84b9158dc2e3d144c82939090a0fa6f5b4ef0'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd shaderc-$pkgver
  ln -frs ../glslang third_party
  ln -frs ../spirv-tools third_party
  ln -frs ../spirv-headers third_party
}

build() {
  mkdir -p build && cd build
  cmake ../shaderc-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSHADERC_SKIP_TESTS=on \
    -DSKIP_GLSLANG_INSTALL=on \
    -DSKIP_SPIRV_TOOLS_INSTALL=on \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -GNinja
  ninja

  cd ../shaderc-$pkgver/glslc
  asciidoctor -b manpage README.asciidoc -o glslc.1
}

package() {
  cd build
  ninja install
  install -Dm644 -t "$pkgdir"/usr/share/man/man1/ ../shaderc-$pkgver/glslc/glslc.1
}
