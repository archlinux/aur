# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=smhasher-git
pkgver=r1406.g83fd13b
pkgrel=1
pkgdesc="Hash function quality and speed tests"
arch=('i686' 'x86_64')
url="https://rurban.github.io/smhasher/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("smhasher=$pkgver")
conflicts=('smhasher')
options=('staticlibs')
source=("git+https://github.com/rurban/smhasher.git")
sha256sums=('SKIP')


prepare() {
  cd "smhasher"

  git submodule update --init --recursive
}

pkgver() {
  cd "smhasher"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "smhasher"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
}

check() {
  cd "smhasher"

  #cmake --build "_build" --target test
}

package() {
  cd "smhasher"

  DESTDIR="$pkgdir" cmake --install "_build"
  rm -r "$pkgdir/usr/include"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/smhasher"
}
