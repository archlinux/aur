# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libssh-git
pkgver=0.10.4.r216.gf9147a3c
pkgrel=1
pkgdesc="Multiplatform C library implementing the SSHv2 and SSHv1 protocol on client and server side"
arch=('i686' 'x86_64')
url="https://www.libssh.org/"
license=('LGPL')
depends=('glibc' 'openssl' 'zlib')
makedepends=('git' 'cmake' 'cmocka')
provides=("libssh=$pkgver")
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
  make -C "_build"
}

package() {
  cd "libssh"

  make -C "_build" DESTDIR="$pkgdir" install
}
