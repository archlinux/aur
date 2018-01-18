# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=debug_assert-git
pkgver=1.3.r1.gbcbc80a
pkgrel=2
pkgdesc="Simple, flexible and modular assertion macro"
arch=('any')
url="https://github.com/foonathan/debug_assert"
license=('ZLIB')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/foonathan/debug_assert.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make install
  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

