# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=avm-git
pkgver=r33583.gd5e8edbeb
pkgrel=1
pkgdesc="The reference software for next codec from Alliance for Open Media"
arch=('i686' 'x86_64')
url="https://gitlab.com/AOMediaCodec/avm"
license=('BSD-3-Clause' 'LicenseRef-avm')
depends=('gcc-libs' 'nasm')
makedepends=('git' 'cmake')
provides=("avm=$pkgver")
conflicts=('avm' 'aom')
options=('staticlibs')
source=("git+https://gitlab.com/AOMediaCodec/avm.git")
sha256sums=('SKIP')


pkgver() {
  cd "avm"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "avm"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "avm"

  #cmake --build "_build" --target test
}

package() {
  cd "avm"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/avm"
}
