# Maintainer: Xingbo Wu <wuxb45 at gmail dot com>
pkgname=spdk-git
pkgver=0   # pkgver() updates this
pkgrel=1
pkgdesc='spdk-git with minimal dependencies'
arch=('x86_64')
license=('BSD')
url='https://spdk.io/'
depends=('glibc')
makedepends=('nasm')
provides=('spdk')
conflicts=('spdk')
source=("$pkgname::git+https://github.com/spdk/spdk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  ./configure --prefix=/usr --with-shared --disable-tests
  make
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir/" make install
}
