# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libaec-git
pkgver=1.1.4.r0.g7204505
pkgrel=1
pkgdesc="Adaptive Entropy Coding library"
arch=('i686' 'x86_64')
url="https://gitlab.dkrz.de/k202009/libaec"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("libaec=$pkgver")
conflicts=('libaec')
options=('staticlibs')
source=("git+https://gitlab.dkrz.de/k202009/libaec.git")
sha256sums=('SKIP')


pkgver() {
  cd "libaec"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libaec"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "libaec"

  #cmake --build "_build" --target test
}

package() {
  cd "libaec"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/libaec"
  mv "$pkgdir"/usr/{,lib}/cmake
}
