# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnfs-git
pkgver=6.0.2.r95.gec2ae23
pkgrel=1
pkgdesc="NFS client library"
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libnfs"
license=('BSD-2-Clause OR GPL-3.0-or-later' 'LicenseRef-libnfs')
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
  cmake --build "_build"
}

check() {
  cd "libnfs"

  #cmake --build "_build" --target test
}

package() {
  cd "libnfs"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {COPYING,LICENCE-BSD.txt} -t "$pkgdir/usr/share/licenses/libnfs"
}
