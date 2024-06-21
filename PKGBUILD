# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=expat-git
pkgver=2.6.2.r55.g4c3f8641
pkgrel=1
pkgdesc="A stream-oriented XML parser library written in C"
arch=('i686' 'x86_64')
url="https://libexpat.github.io/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("expat=$pkgver" 'libexpat.so')
conflicts=('expat')
source=("git+https://github.com/libexpat/libexpat.git")
sha256sums=('SKIP')


pkgver() {
  cd "libexpat/expat"

  _tag=$(git tag -l --sort -v:refname | grep -E 'R_[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/R_//;s/_/./g'
}

build() {
  cd "libexpat/expat"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  make -C "_build"
}

check() {
  cd "libexpat/expat"

  #make -C "_build" test
}

package() {
  cd "libexpat/expat"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/expat"
}
