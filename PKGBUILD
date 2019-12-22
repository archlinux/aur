# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=bls-git
pkgver=r463.754b28c
pkgrel=1
pkgdesc='An implementation of BLS threshold signature'
arch=('x86_64')
url='https://github.com/herumi/bls'
license=('BSD')
depends=('gmp'
         'libmcl')
makedepends=('cmake'
             'git')
source=(git+https://github.com/herumi/bls)
sha256sums=('SKIP')

pkgver() {
  cd bls

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd bls

  mkdir -p build
  env -C build cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make -C build
}

package() {
  cd bls

  make -C build DESTDIR="$pkgdir" install
}
