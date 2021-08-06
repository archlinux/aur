# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-git
pkgver=r25881.g81400109f3
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('i686' 'x86_64')
url="https://leanprover.github.io/"
license=('apache')
depends=('glibc' 'gmp')
makedepends=('git' 'cmake')
provides=('lean4')
conflicts=('lean4')
options=('staticlibs')
source=("git+https://github.com/leanprover/lean4.git")
sha256sums=('SKIP')


pkgver() {
  cd "lean4"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lean4"
}
