# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: James An <james@jamesan.ca>

_pkgname=darling-dmg
pkgname=$_pkgname-git
pkgver=1.0.4.r15.g4e3a2ed
pkgrel=1
epoch=1
pkgdesc="FUSE module for .dmg files (containing an HFS+ filesystem)"
arch=('i686' 'x86_64')
license=('GPL3')
url='https://www.darlinghq.org'
depends=('bzip2' 'fuse' 'icu' 'libxml2' 'openssl' 'zlib')
# boost is used only in check() but the build step requires it to build a test executable
makedepends=('cmake' 'git' 'boost')
source=("git+https://github.com/darlinghq/darling-dmg")
sha256sums=('SKIP')
conflicts=('darling-git' "$_pkgname")
provides=("$_pkgname=$pkgver")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build && cd build

    cmake -DWITH_TESTS=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

    make
}

check() {
    cd "$srcdir/$_pkgname/build"

    make test
}

package() {
    cd "$srcdir/$_pkgname/build"

    make DESTDIR="$pkgdir" install
}

