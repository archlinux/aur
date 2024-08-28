# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=demoiccmax-git
pkgver=r344.gdc78afc
pkgrel=1
pkgdesc="Demonstration Implementation for iccMAX color profiles"
arch=('i686' 'x86_64')
url="https://www.color.org/iccmax.xalter"
license=('LicenseRef-demoiccmax')
depends=('gcc-libs' 'libtiff' 'libxml2')
makedepends=('git' 'cmake' 'nlohmann-json')
provides=("demoiccmax=$pkgver")
conflicts=('demoiccmax')
options=('staticlibs')
source=("git+https://github.com/InternationalColorConsortium/DemoIccMAX.git")
sha256sums=('SKIP')


pkgver() {
  cd "DemoIccMAX"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "DemoIccMAX"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DUSE_SYSTEM_LIBXML2=ON \
    Build/Cmake
  cmake --build "_build"
}

check() {
  cd "DemoIccMAX"

  #cmake --build "_build" --target test
}

package() {
  cd "DemoIccMAX"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/demoiccmax"
}
