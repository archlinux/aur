# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=quickjs-ng-git
pkgver=0.17.0.r2.g19dbe85
pkgrel=1
pkgdesc="A mighty JavaScript engine"
arch=('i686' 'x86_64')
url="https://quickjs-ng.github.io/quickjs/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("quickjs-ng=$pkgver")
conflicts=('quickjs-ng')
source=("git+https://github.com/quickjs-ng/quickjs.git")
sha256sums=('SKIP')


pkgver() {
  cd "quickjs"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "quickjs"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    -DQJS_BUILD_LIBC=ON \
    ./
  cmake --build "_build"
}

package() {
  cd "quickjs"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/quickjs-ng"
}
