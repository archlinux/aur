# Maintainer: Tiago Porsch Dopke <tiagoporsch@icloud.com>

pkgname=mdfview-git
pkgver=r256.gfdaa8b4
pkgrel=1
pkgdesc="Simple MDF file browser"
arch=('i686' 'x86_64')
url="https://ihedvall.github.io/mdflib/"
license=('MIT')
depends=('boost' 'expat' 'wxwidgets' 'zlib')
makedepends=('git' 'cmake')
provides=('mdflib')
conflicts=('mdflib')
options=('staticlibs')
source=("git+https://github.com/ihedvall/mdflib.git")
sha256sums=('SKIP')

pkgver() {
  cd "mdflib"
  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "mdflib"
  cmake \
    -B "build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DMDF_BUILD_SHARED_LIB=OFF \
    -DMDF_BUILD_TOOL=ON \
    ./
  make -C "build"
}

package() {
  cd "mdflib"
  make -C "build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mdflib"
  install -Dm644 "../../mdfview.desktop" -t "$pkgdir/usr/share/applications"
}
