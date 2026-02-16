# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ng-log-git
pkgver=0.8.2.r28.g4f95db8
pkgrel=1
pkgdesc="C++ library for application-level logging"
arch=('i686' 'x86_64')
url="https://ng-log.github.io/ng-log/stable/"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake')
provides=("ng-log=$pkgver")
conflicts=('ng-log')
source=("git+https://github.com/ng-log/ng-log.git")
sha256sums=('SKIP')


pkgver() {
  cd "ng-log"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ng-log"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DWITH_PKGCONFIG=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "ng-log"

  #cmake --build "_build" --target test
}

package() {
  cd "ng-log"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/ng-log"
}

