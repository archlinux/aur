# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Robert Rakhmatulin <drakonu@otso.city>

pkgver=r17292.1372ca086
pkgname=embree-git
pkgrel=1
pkgdesc="A collection of high-performance ray tracing kernels."
arch=(x86_64)
url="https://github.com/RenderKit/embree"
license=(Apache-2.0)
depends=(glibc gcc-libs sh tbb)
makedepends=(git cmake ispc freeglut libxmu openexr)
provides=(embree)
conflicts=(embree)
source=("git+https://github.com/RenderKit/embree.git")
sha256sums=('SKIP')

pkgver() {
  cd "embree"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # None buildtype not allowed

  local _flags=(
	-DEMBREE_TUTORIALS=OFF
	-DEMBREE_MAX_ISA="AVX512SKX" # Embree detects actual ISA at runtime
  )

  cmake -B build -S "embree" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build

      #-DCMAKE_INSTALL_LIBDIR=lib \
      #-DCMAKE_BUILD_TYPE= \
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
