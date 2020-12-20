# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=git-credential-kwallet-git
_pkgname=git-credential-kwallet
pkgver=0.1.0.r12.9430213
_pkgver=0.1.0
pkgrel=1
pkgdesc='Git credential helper for KWallet'
arch=('x86_64')
url='https://github.com/Templar-von-Midgard/git-credential-kwallet'
license=('MIT')
depends=('kwallet')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('cmake' 'make' 'git')
sha256sums=('SKIP')
source=('git+https://github.com/Templar-von-Midgard/git-credential-kwallet')

pkgver() {
  cd "$srcdir/$_pkgname"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf $_pkgver."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
}

build() {
  cd "$srcdir/$_pkgname/build"

  make
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir" install

  cd ..
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

