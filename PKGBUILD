# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libuv-git
pkgver=1.39.0.r100.gdec07238
pkgrel=1
pkgdesc="A multi-platform support library with a focus on asynchronous I/O"
arch=('i686' 'x86_64')
url="https://libuv.org/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'python-sphinx')
provides=('libuv')
conflicts=('libuv')
options=('staticlibs')
source=("git+https://github.com/libuv/libuv.git#branch=master")
sha256sums=('SKIP')


pkgver() {
  cd "libuv"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libuv"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
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

  install -Dm644 "docs/build/man/libuv.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libuv"
}
