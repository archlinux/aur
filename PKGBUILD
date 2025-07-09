# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=c-ares-git
pkgver=1.29.0.r366.g71663adc
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=('i686' 'x86_64')
url="https://c-ares.org/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("c-ares=$pkgver" 'libcares.so')
conflicts=('c-ares')
options=('staticlibs')
source=("git+https://github.com/c-ares/c-ares.git")
sha256sums=('SKIP')


pkgver() {
  cd "c-ares"

  _tag=$(git tag -l --sort -v:refname | grep -E 'cares-[0-9\._]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^cares-//;s/_/./g'
}

build() {
  cd "c-ares"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCARES_STATIC=ON \
    ./
  cmake --build "_build"
}

package() {
  cd "c-ares"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/c-ares"
  install -Dm644 {CONTRIBUTING,README,RELEASE-NOTES}.md -t "$pkgdir/usr/share/doc/c-ares"
}
