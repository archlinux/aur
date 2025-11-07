# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from mold-git [https://aur.archlinux.org/packages/mold-git] by
# Maintainer: Peter Jung <ptr1337@cachyos.org>
pkgname=mold-x86-git
pkgver=2.40.4.r59.g016bb8af
pkgrel=1
pkgdesc='A Modern Linker - patched to compile only for x86 target'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# xxhash is bundled
depends=(
  glibc
  gcc-libs
  libblake3
  mimalloc
  zstd
)
makedepends=(
  cmake
  git
  mold
  python
)
checkdepends=(
  clang
  libdwarf
)
source=("mold::git+https://github.com/rui314/mold"
        'x86.patch')
b2sums=('SKIP'
        '9b6d8dece09dcca8faaea9d0261690427260b56dfe8582718e219b7db9f636afdf9bbd398e66a4e49b2648c5706238255366e86b9830d5aa09abd74da41c9b49')
provides=("mold=$pkgver")
conflicts=("mold")
_reponame="mold"

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$_reponame"
    patch -p1 -i ../x86.patch
}

build() {
  cmake \
  -S "$_reponame" \
  -B build \
  -G Ninja \
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
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_reponame}"/LICENSE "${pkgdir}"/usr/share/licenses/mold/LICENSE
}
