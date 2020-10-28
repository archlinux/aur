# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=onednn-git
pkgver=2.0_beta09.r663.gd58524e69
pkgrel=2
pkgdesc="An open-source performance library for deep learning applications"
arch=('i686' 'x86_64')
url="https://01.org/oneDNN"
license=('apache')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'doxygen')
provides=('onednn')
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
  make -C "_build"
  make -C "_build" doc
}

check() {
  cd "oneDNN"

  #make -C "_build" DESTDIR="$pkgdir" test
}

package() {
  cd "oneDNN"

  make -C "_build" DESTDIR="$pkgdir" install
}
