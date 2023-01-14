# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pe-parse-git
pkgver=2.1.1.r3.gc17d4bb
pkgrel=1
pkgdesc="Principled, lightweight C/C++ PE parser"
arch=('i686' 'x86_64')
url="https://github.com/trailofbits/pe-parse"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("pe-parse=$pkgver")
conflicts=('pe-parse')
source=("git+https://github.com/trailofbits/pe-parse.git")
sha256sums=('SKIP')


prepare() {
  cd "pe-parse"

  sed -i -e 's|-Werror||g' "cmake/compilation_flags.cmake"
}

pkgver() {
  cd "pe-parse"

  _tag=$(git tag -l --sort -v:refname | grep -P '^v?[\d\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "pe-parse"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "pe-parse"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/pe-parse"
}
