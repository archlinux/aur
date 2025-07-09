# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=prplmesh-git
pkgver=5.0.1.r99.gaebf3a83e
pkgrel=1
pkgdesc="WFA Multi-AP implementation"
arch=('i686' 'x86_64')
url="https://prplfoundation.org/prplmesh/"
license=('BSD-2-Clause' 'LicenseRef-prplmesh')
depends=('glibc' 'json-c' 'ncurses' 'openssl' 'readline' 'zeromq')
makedepends=('git' 'cmake' 'libnl' 'python-yaml')
provides=("prplmesh=$pkgver")
conflicts=('prplmesh')
source=("git+https://gitlab.com/prpl-foundation/prplmesh/prplMesh.git")
sha256sums=('SKIP')


pkgver() {
  cd "prplMesh"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "prplMesh"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "prplMesh"

  DESTDIR="$pkgdir" cmake --install "_build"

  install -d "$pkgdir/usr/share/prplmesh"
  mv "$pkgdir/usr/share/prplmesh_platform_db" "$pkgdir/usr/share/prplmesh"
  mv "$pkgdir/usr/"{config,host,scripts} "$pkgdir/usr/share/prplmesh"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/prplmesh"
}
