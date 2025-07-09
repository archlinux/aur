# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmatroska-git
pkgver=1.7.1.r281.g395563f
pkgrel=1
pkgdesc="C++ libary to parse Matroska files"
arch=('i686' 'x86_64')
url="https://matroska.org/index.html"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libebml.so')
makedepends=('git' 'cmake')
provides=("libmatroska=$pkgver" 'libmatroska.so')
conflicts=('libmatroska')
source=("git+https://github.com/Matroska-Org/libmatroska.git")
sha256sums=('SKIP')


pkgver() {
  cd "libmatroska"

  _tag=$(git tag -l --sort -v:refname | grep -E '^release-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release-//'
}

build() {
  cd "libmatroska"

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
  cd "libmatroska"

  DESTDIR="$pkgdir" cmake --install "_build"
}
