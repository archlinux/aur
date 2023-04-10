# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wabt-git
pkgver=1.0.32.r51.g539c541b
pkgrel=2
pkgdesc="The WebAssembly binary toolkit"
arch=('i686' 'x86_64')
url="https://github.com/WebAssembly/wabt"
license=('Apache')
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
  make -C "_build"
}

check() {
  cd "wabt"

  #make -C "_build" check
}

package() {
  cd "wabt"

  make -C "_build" DESTDIR="$pkgdir" install
}
