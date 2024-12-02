# Maintainer: Nicolas Derumigny <nderumigny@gmail.com>

pkgname=('polylib-git' 'polylib-gmp-git')
pkgbase='polylib-git'
_pkgbase='polylib'
pkgver='5.22.09a1d8f'
pkgrel=1
pkgdesc='A library of polyhedral functions'
arch=('i686' 'x86_64')
url='http://icps.u-strasbg.fr/polylib/'
license=('GPL')
depends=('gmp')
makedepends=('git')
source=("${pkgname}::git+https://github.com/vincentloechner/polylib.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_pkgbase"

    # now we build the normal version of polylib
    echo "compiling normal version of Polylib"
    ./autogen.sh
    [ -d "polylib" ] || mkdir "polylib"
    cd polylib
    ../configure --prefix=/usr --without-libgmp
    make

    cd ..
    # now we build the GMP version of polylib
    echo "compiling GMP version of Polylib"
    [ -d "polylibgmp" ] || mkdir "polylibgmp"
    cd polylibgmp
    ../configure --prefix=/usr --with-libgmp
    make
}

check() {
    cd "$srcdir/$_pkgbase"

    # check the normal version
    cd polylib
    make check

    cd ..
    # check the GMP version
    cd polylibgmp
    make check
}

package_polylib-git() {
    provides=("polylib=$pkgver")
    conflicts=('polylib')
    cd "$srcdir/$_pkgbase/polylib"
    make DESTDIR="$pkgdir" install
}

package_polylib-gmp-git() {
    provides=("polylib-gmp=$pkgver")
    conflicts=('polylib-gmp')
    depends=("polylib=$pkgver")
    cd "$srcdir/$_pkgbase/polylibgmp"
    make DESTDIR="$pkgdir" install-exec

    cd "$pkgdir"
    # Nasty rename to ensure we can co-exist with polylib
    mv usr/bin/c2p usr/bin/c2p-gmp
    mv usr/bin/disjoint_union_adj usr/bin/disjoint_union_adj-gmp
    mv usr/bin/disjoint_union_sep usr/bin/disjoint_union_sep-gmp
    mv usr/bin/ehrhart_lower_bound usr/bin/ehrhart_lower_bound-gmp
    mv usr/bin/ehrhart_quick_apx usr/bin/ehrhart_quick_apx-gmp
    mv usr/bin/ehrhart_upper_bound usr/bin/ehrhart_upper_bound-gmp
    mv usr/bin/findv usr/bin/findv-gmp
    mv usr/bin/r2p usr/bin/r2p-gmp
}
