# Maintainer: melchips <truphemus dot francois at gmail dot com>
pkgname=tortosa-git
pkgver=r34.5bc1850
pkgrel=1
pkgdesc="Terminal emulator based on the vte3 library"
arch=('i686' 'x86_64')
url="https://github.com/cedlemo/Tortosa"
license=('MIT')
depends=('gtk3' 'vte3')
makedepends=('git')
source=(tortosa::git+https://github.com/cedlemo/Tortosa.git)
provides=("tortosa")
conflicts=("tortosa")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tortosa"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/tortosa"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/tortosa"
  make DESTDIR=$pkgdir install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
