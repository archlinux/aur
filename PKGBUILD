# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=alembic-git
pkgver=1.8.8.r0.g43a1489a
pkgrel=1
pkgdesc="An open framework for storing and sharing scene data"
arch=('i686' 'x86_64')
url="https://www.alembic.io/"
license=('BSD-3-Clause' 'LicenseRef-alembic')
depends=('glibc' 'hdf5' 'imath')
makedepends=('git' 'cmake')
provides=("alembic=$pkgver")
conflicts=('alembic')
source=("git+https://github.com/alembic/alembic.git")
sha256sums=('SKIP')


pkgver() {
  cd "alembic"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "alembic"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DUSE_HDF5=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "alembic"

  #cmake --build "_build" --target test
}

package() {
  cd "alembic"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/alembic"
}
