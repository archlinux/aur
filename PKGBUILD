# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libssh-git
pkgver=0.11.2.r238.g7a2a743a
pkgrel=1
pkgdesc="Multiplatform C library implementing the SSHv2 and SSHv1 protocol on client and server side"
arch=('i686' 'x86_64')
url="https://www.libssh.org/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'openssl' 'zlib')
makedepends=('git' 'cmake' 'cmocka')
provides=("libssh=$pkgver" 'libssh.so')
conflicts=('libssh')
options=('staticlibs')
source=("git+https://git.libssh.org/projects/libssh.git")
sha256sums=('SKIP')


pkgver() {
  cd "libssh"

  _tag=$(git tag -l --sort -v:refname | grep -E '^libssh-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libssh-//'
}

build() {
  cd "libssh"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
}

package() {
  cd "libssh"

  DESTDIR="$pkgdir" cmake --install "_build"
}
