# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=demoiccmax-git
pkgver=2.3.1.4.r2.ge4ccd8e
pkgrel=1
pkgdesc="Demonstration Implementation for iccMAX color profiles"
arch=('i686' 'x86_64')
url="https://www.color.org/iccmax.xalter"
license=('LicenseRef-demoiccmax')
depends=('glibc' 'libgcc' 'libstdc++' 'libtiff' 'libxml2' 'wxwidgets-gtk3')
makedepends=('git' 'clang' 'cmake' 'nlohmann-json')
provides=("demoiccmax=$pkgver")
conflicts=('demoiccmax')
options=('staticlibs')
source=("git+https://github.com/InternationalColorConsortium/iccDEV.git")
sha256sums=('SKIP')


pkgver() {
  cd "iccDEV"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "iccDEV"

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
  cd "iccDEV"

  #cmake --build "_build" --target test
}

package() {
  cd "iccDEV"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/demoiccmax"
}
