# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjuice-git
pkgver=1.4.0.r0.gac0fc81
pkgrel=1
pkgdesc="JUICE is a UDP Interactive Connectivity Establishment library"
arch=('i686' 'x86_64')
url="https://github.com/paullouisageneau/libjuice"
license=('MPL-2.0')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("libjuice=$pkgver")
conflicts=('libjuice')
source=("git+https://github.com/paullouisageneau/libjuice.git")
sha256sums=('SKIP')


pkgver() {
  cd "libjuice"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libjuice"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "libjuice"

  #cmake --build "_build" --target tests
}

package() {
  cd "libjuice"

  DESTDIR="$pkgdir" cmake --install "_build"
}

