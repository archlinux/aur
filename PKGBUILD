# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=popt-git
pkgver=1.19.r34.g63f0967
pkgrel=1
pkgdesc="C library for parsing command line parameters"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/popt"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("popt=$pkgver")
conflicts=('popt')
options=('staticlibs')
source=("git+https://github.com/rpm-software-management/popt.git")
sha256sums=('SKIP')


pkgver() {
  cd "popt"

  _tag=$(git tag -l --sort -creatordate | grep -E 'popt-[0-9\._]+-release$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^popt-//;s/-release//'
}

build() {
  cd "popt"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "popt"

  #cmake --build "_build" --target test
}

package() {
  cd "popt"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/popt"
}
