# Maintainer: Peter Jung <ptr1337@cachyos.org>
# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=mold
pkgname=${_reponame}-git
pkgver=2.40.4.r76.gfc96c1b9
pkgrel=1
pkgdesc='A Modern Linker'
arch=('x86_64')
url="https://github.com/rui314/$_reponame"
license=('MIT')
# bundled: xxhash, mimalloc
depends=(
  glibc
  libblake3
  libstdc++
  tbb
  zlib
  zstd
)
makedepends=(
  cmake
  ninja
  git
  mold
  python
)
checkdepends=(
  clang
  libdwarf
)
source=("git+${url}.git")
b2sums=('SKIP')
provides=("$_reponame=$pkgver")
conflicts=("$_reponame")

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -S "$_reponame"
    -B build
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE='None'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_INSTALL_LIBEXECDIR='lib'
    -D MOLD_USE_SYSTEM_MIMALLOC=OFF
    -D MOLD_USE_SYSTEM_TBB=ON
    -D MOLD_LTO=ON
    -D MOLD_USE_MOLD=ON
  )

  cmake ${cmake_options[@]}

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_reponame/LICENSE"
}
# vim: ts=2 sw=2 et:
