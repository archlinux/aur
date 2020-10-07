# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=prplmesh-git
pkgver=r4893.g96b2d694
pkgrel=1
pkgdesc="WFA Multi-AP implementation"
arch=('i686' 'x86_64')
url="https://prplfoundation.org/prplmesh/"
license=('BSD' 'custom')
depends=('glibc' 'json-c' 'ncurses' 'openssl' 'readline' 'zeromq')
makedepends=('git' 'cmake' 'libnl' 'python-yaml')
provides=('prplmesh')
conflicts=('prplmesh')
source=("git+https://github.com/prplfoundation/prplMesh.git")
sha256sums=('SKIP')


pkgver() {
  cd "prplMesh"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "prplMesh"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "prplMesh"

  make -C "_build" DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/prplmesh"
  mv "$pkgdir/usr/share/prplmesh_platform_db" "$pkgdir/usr/share/prplmesh"
  mv "$pkgdir/usr/"{config,host,scripts} "$pkgdir/usr/share/prplmesh"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/prplmesh"
}
