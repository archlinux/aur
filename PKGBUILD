# Maintainer: Nathaniel R. Lewis <linux.robotdude@gmail.com>
# Contributor: Chloe Brown <chloe dot brown dot 00 at outlook dot com>

_pkgbase='herdtools7'
pkgname=('herdtools7-git')
provides=('herdtools7')
conflicts=('herdtools7')
pkgver=7.52.r1322.g650450b6
pkgrel=1
pkgdesc="The Herd toolsuite to deal with .cat memory models"
arch=('i686' 'x86_64')
url='https://github.com/herd/herdtools7'
license=('CeCILL-B')
depends=('ocaml')
makedepends=('git' 'make' 'dune' 'ocaml-menhir')
source=('git://github.com/herd/herdtools7' '0001-Add-DESTDIR-support.patch')
sha256sums=('SKIP'
            'f620292cd27f6183cb5029c87bf3e70ffafd3444d584055512e80a475f10f993')

prepare() {
    cd $srcdir/$_pkgbase
    git apply $srcdir/0001-Add-DESTDIR-support.patch
}

build() {
    cd $srcdir/$_pkgbase
    make PREFIX="/usr"
}

check() {
    cd $srcdir/$_pkgbase
    make test PREFIX="/usr"
}

pkgver() {
    cd $srcdir/$_pkgbase
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    mkdir -p "$pkgdir/usr/share/doc"

    # Add a shim for /usr/doc, because dune installs it wrong
    ln -s "$pkgdir/usr/share/doc" "$pkgdir/usr/doc"
    DESTDIR="$pkgdir" make -C $srcdir/$_pkgbase PREFIX="usr" install
    rm "$pkgdir/usr/doc"   
}
