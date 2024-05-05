# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=mold-git
pkgver=2.31.0.r12.g5ec3d2dc
pkgrel=1
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# xxhash is bundled
depends=('glibc' 'gcc-libs' 'mimalloc' 'zlib' 'tbb' 'zstd')
makedepends=('git' 'python' 'cmake' 'mold')
checkdepends=('clang' 'libdwarf')
source=("mold::git+https://github.com/rui314/mold")
b2sums=('SKIP')
provides=("mold=$pkgver")
conflicts=("mold")
_reponame="mold"

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake \
  -S "$_reponame" \
  -B build \
  -D CMAKE_BUILD_TYPE='None' \
  -D CMAKE_INSTALL_PREFIX='/usr' \
  -D CMAKE_INSTALL_LIBEXECDIR='lib' \
  -D MOLD_USE_SYSTEM_MIMALLOC=ON \
  -D MOLD_USE_SYSTEM_TBB=ON \
  -D MOLD_LTO=ON \
  -D MOLD_USE_MOLD=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
