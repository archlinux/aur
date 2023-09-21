# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=mold-git
pkgver=v2.1.0_109_g9e09e74d
pkgrel=1
pkgdesc="A Modern Linker"
arch=(x86_64)
url="https://github.com/rui314/mold"
license=("AGPL3")
# xxhash is bundled
depends=('gcc-libs' 'mimalloc' 'openssl' 'zlib' 'tbb')
makedepends=('git' 'python' 'cmake' 'mold')
checkdepends=('clang' 'libdwarf')
source=("mold::git+https://github.com/rui314/mold")
sha256sums=('SKIP')
provides=("mold=$pkgver")
conflicts=("mold")
_reponame="mold"

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed "s/-/_/g"
}


build() {
  cmake \
  -S "$_reponame" \
  -B build \
  -DCMAKE_BUILD_TYPE='None' \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBEXECDIR='lib' \
  -DMOLD_USE_SYSTEM_MIMALLOC=ON \
  -DMOLD_USE_SYSTEM_TBB=ON \
  -DMOLD_USE_MOLD=ON \
  -DMOLD_LTO=ON

  cmake --build build
}


check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
