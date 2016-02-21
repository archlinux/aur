# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: James An <james@jamesan.ca>

_pkgname=darling-dmg
_github_addr=darlinghq/darling-dmg
pkgname=$_pkgname-git
pkgver=1.0.4.r1.gb7ce87b
pkgrel=1
epoch=1
pkgdesc="FUSE module for .dmg files (containing an HFS+ filesystem)"
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.darlinghq.org'
depends=('bzip2' 'fuse' 'icu' 'libxml2' 'openssl' 'zlib')
# boost is used only in check() but the build step requires it to build a test executable
makedepends=('cmake' 'git' 'boost')
source=("$_pkgname"::"git+https://github.com/$_github_addr")
sha256sums=('SKIP')
conflicts=('darling-git')

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

