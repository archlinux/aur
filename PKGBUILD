# Maintainer: Your Name <your.email@example.com>
pkgname=clang-include-graph-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to generate include dependency graphs for C/C++ projects."
arch=('x86_64')
url="https://github.com/bkryza/clang-include-graph"
license=('MIT')
depends=('gcc-libs' 'glibc' 'clang' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'llvm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bkryza/clang-include-graph/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # patch to make tests conditional
  sed -i 's/^add_subdirectory(tests)$/if(BUILD_TESTS)\nadd_subdirectory(tests)\nendif()/' CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF

  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the main binary manually
  install -Dm755 build/clang-include-graph "${pkgdir}/usr/bin/clang-include-graph"

  # Install license
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
