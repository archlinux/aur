# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aom-git
pkgver=3.6.1.r733.g233000f66e9
pkgrel=1
pkgdesc="An open, royalty-free video coding format designed for video transmissions over the Internet"
arch=('i686' 'x86_64')
url="https://aomedia.org/"
license=('BSD' 'custom:PATENTS')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'doxygen' 'graphviz' 'perl' 'yasm')
checkdepends=('python')
provides=("aom=$pkgver" 'libaom.so')
conflicts=('aom')
source=("git+https://aomedia.googlesource.com/aom")
sha256sums=('SKIP')


pkgver() {
  cd "aom"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "aom"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_TESTS=OFF \
    ./
  make -C "_build"
}

check() {
  cd "aom"

  #make -C "_build" runtests
}

package() {
  cd "aom"

  make -C "_build" DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/doc/aom"
  cp -R "_build/docs/." "$pkgdir/usr/share/doc/aom"

  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/aom"
}
