# Maintainer: Nathaniel R. Lewis <linux.robotdude@gmail.com>

_pkgbase='herdtools7'
pkgname=('herdtools7-git')
provides=('herdtools7')
conflicts=('herdtools7')
pkgver=r742.f2bb279
pkgrel=1
pkgdesc="The Herd toolsuite to deal with .cat memory models"
arch=('i686' 'x86_64')
url='https://github.com/herd/herdtools7'
license=('CeCILL-B')
depends=('ocaml')
makedepends=('git' 'make' 'ocamlbuild')
source=('git://github.com/herd/herdtools7'
        'create-installation-paths.patch')
sha256sums=('SKIP'
            'a7b8c376201196064835fba0d646bee567fe2932900772045a75b6bdd2a9a2ff')

prepare() {
    cd $srcdir/$_pkgbase
    git apply ../create-installation-paths.patch
}

build() {
    cd $srcdir/$_pkgbase
    make $MAKEFLAGS PREFIX="/usr"
}

pkgver() {
    cd $srcdir/$_pkgbase
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    make -C $srcdir/$_pkgbase PREFIX="$pkgdir/usr" install
}

