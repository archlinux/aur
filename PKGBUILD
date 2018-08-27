# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libuv-git
pkgver=1.23.0.r83.g6e7da5fb
pkgrel=1
pkgdesc="A multi-platform support library with a focus on asynchronous I/O"
arch=('i686' 'x86_64')
url="https://libuv.org/"
license=('MIT')
depends=('glibc' 'libnsl')
makedepends=('git' 'python-sphinx')
provides=('libuv')
conflicts=('libuv')
options=('staticlibs')
source=("git+https://github.com/libuv/libuv.git#branch=master")
sha256sums=('SKIP')


pkgver() {
  cd "libuv"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "libuv"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
  make -C "docs" man
}

check() {
  cd "libuv"

  make check
}

package() {
  cd "libuv"

  make DESTDIR="$pkgdir" install

  install -Dm644 "docs/build/man/libuv.1" "$pkgdir/usr/share/man/man1/libuv.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libuv/LICENSE"
}
