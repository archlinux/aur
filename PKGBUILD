# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libfdk-aac-git
pkgver=2.0.3.r0.g716f439
pkgrel=1
pkgdesc="Modified library of Fraunhofer AAC decoder and encoder"
arch=('i686' 'x86_64')
url="https://opencore-amr.sourceforge.io/"
license=('custom')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("libfdk-aac=$pkgver" 'libfdk-aac.so')
conflicts=('libfdk-aac')
source=("git+https://git.code.sf.net/p/opencore-amr/fdk-aac")
sha256sums=('SKIP')


pkgver() {
  cd "fdk-aac"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "fdk-aac"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "fdk-aac"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "NOTICE" -t "$pkgdir/usr/share/licenses/libfdk-aac"
}
