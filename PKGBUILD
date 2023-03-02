# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-git
pkgver=4.0.0.m5.r1507.g0da281fab4
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('i686' 'x86_64')
url="https://leanprover.github.io/"
license=('apache')
depends=('glibc' 'gmp')
makedepends=('git' 'cmake')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source=("git+https://github.com/leanprover/lean4.git")
sha256sums=('SKIP')


prepare() {
  cd "lean4"

  git submodule update --init --recursive
}

pkgver() {
  cd "lean4"

  _tag=$(git tag -l --sort -v:refname | grep -P '^v?[\d\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./'
}

build() {
  cd "lean4"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build" stage2
}

check() {
  cd "lean4"

  #make -C "_build/stage2" test
}

package() {
  cd "lean4"

  make -C "_build/stage2" DESTDIR="$pkgdir" install
}
