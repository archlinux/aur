# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnfs-git
pkgver=5.0.2.r84.g465a12d
pkgrel=1
pkgdesc="NFS client library"
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libnfs"
license=('BSD-2-Clause OR GPL-3.0-or-later' 'custom')
depends=('glibc')
makedepends=('git' 'cmake' 'docbook-xsl')
provides=("libnfs=$pkgver")
conflicts=('libnfs')
source=("git+https://github.com/sahlberg/libnfs.git")
sha256sums=('SKIP')


pkgver() {
  cd "libnfs"

  _tag=$(git tag -l --sort -v:refname | grep -E '^libnfs-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libnfs-//'
}

build() {
  cd "libnfs"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_DOCUMENTATION=ON \
    -DENABLE_UTILS=ON \
    ./
  make -C "_build"
}

check() {
  cd "libnfs"

  #make -C "_build" test
}

package() {
  cd "libnfs"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 {COPYING,LICENCE-BSD.txt} -t "$pkgdir/usr/share/licenses/libnfs"
}
