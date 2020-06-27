# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=frozen-git
pkgver=1.0.0.r10.g3d2b025
pkgrel=1
pkgdesc="Header-only C++ library that provides 0 cost initialization for immutable containers"
arch=('any')
url="https://github.com/serge-sans-paille/frozen"
license=('Apache')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/$pkgname/build"
}

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
  git describe --tags 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
