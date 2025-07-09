# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wabt-git
pkgver=1.0.37.r27.ga55fb946
pkgrel=1
pkgdesc="The WebAssembly binary toolkit"
arch=('i686' 'x86_64')
url="https://github.com/WebAssembly/wabt"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'clang' 'cmake' 'gcc')
provides=("wabt=$pkgver")
conflicts=('wabt')
options=('staticlibs')
source=("git+https://github.com/WebAssembly/wabt.git")
sha256sums=('SKIP')


prepare() {
  cd "wabt"

  git submodule update --init --recursive
}

pkgver() {
  cd "wabt"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "wabt"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "wabt"

  #cmake --build "_build" --target check
}

package() {
  cd "wabt"

  DESTDIR="$pkgdir" cmake --install "_build"
}
