# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: lubosz <lubosz@gmail.com>
# Contributor: socke <github@socker.lepus.uberspace.de>

pkgname=assimp-git
pkgver=6.0.4.r6.gb4c7912d2
pkgrel=1
pkgdesc="Open Asset Importer Library"
arch=('i686' 'x86_64')
url="https://www.assimp.org/"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
makedepends=('git' 'cmake')
provides=("assimp=$pkgver")
conflicts=('assimp')
source=("git+https://github.com/assimp/assimp.git")
sha256sums=('SKIP')


pkgver() {
  cd "assimp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "assimp"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DASSIMP_BUILD_ASSIMP_TOOLS=ON \
    -DASSIMP_BUILD_ZLIB=OFF \
    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
    ./
  cmake --build "_build"
}

check() {
  cd "assimp"

  #cmake --build "_build" --target test
}

package() {
  cd "assimp"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/assimp"
}
