# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=onednn-git
pkgver=3.9_pc.r389.g5f44f1ec49
pkgrel=1
pkgdesc="An open-source performance library for deep learning applications"
arch=('i686' 'x86_64')
url="https://01.org/oneDNN"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'doxygen')
provides=("onednn=$pkgver")
conflicts=('onednn')
source=("git+https://github.com/oneapi-src/oneDNN.git")
sha256sums=('SKIP')


pkgver() {
  cd "oneDNN"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/_/g'
}

build() {
  cd "oneDNN"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
  cmake --build "_build" --target doc
}

check() {
  cd "oneDNN"

  #DESTDIR="$pkgdir" cmake --build "_build" --target test
}

package() {
  cd "oneDNN"

  DESTDIR="$pkgdir" cmake --install "_build"
}
