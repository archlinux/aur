# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libebml-git
pkgver=1.4.5.r521.g50a4d44
pkgrel=1
pkgdesc="Extensible Binary Meta Language library"
arch=('i686' 'x86_64')
url="https://github.com/Matroska-Org/libebml"
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("libebml=$pkgver" 'libebml.so')
conflicts=('libebml')
source=("git+https://github.com/Matroska-Org/libebml.git")
sha256sums=('SKIP')


pkgver() {
  cd "libebml"

  _tag=$(git tag -l --sort -v:refname | grep -E '^release-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release-//'
}

build() {
  cd "libebml"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  cmake --build "_build"
}

package() {
  cd "libebml"

  DESTDIR="$pkgdir" cmake --install "_build"
}
