# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openexr-git
pkgver=3.3.4.r123.g45ee1275
pkgrel=1
pkgdesc="Reference implementation of the EXR format"
arch=('i686' 'x86_64')
url="https://www.openexr.com/"
license=('BSD-3-Clause')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake' 'boost' 'chrpath' 'freeglut' 'python' 'python-numpy')
optdepends=('boost-libs: python support'
            'python: python support')
provides=("openexr=$pkgver")
conflicts=('openexr' 'ilmbase')
source=("git+https://github.com/AcademySoftwareFoundation/openexr.git")
sha256sums=('SKIP')


pkgver() {
  cd "openexr"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "openexr"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
}

check() {
  cd "openexr"

  #cmake --build "_build" --target test
}

package() {
  cd "openexr"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {LICENSE.md,PATENTS} -t "$pkgdir/usr/share/licenses/openexr"
}
