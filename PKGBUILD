# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

_pkgname=darling-dmg
_github_addr=darlinghq/darling-dmg
pkgname=$_pkgname-git
pkgver=r69.9c678a4
pkgrel=1
pkgdesc="FUSE module for .dmg files (containing an HFS+ filesystem)"
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.darlinghq.org'
depends=('bzip2' 'fuse' 'icu' 'libxml2' 'openssl' 'zlib')
makedepends=('cmake' 'git')
source=("$_pkgname"::"git+https://github.com/$_github_addr")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build && cd build

    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

    make
}

package() {
    cd "$srcdir/$_pkgname/build"

    make DESTDIR="$pkgdir" install
}

