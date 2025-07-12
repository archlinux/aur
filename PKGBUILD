# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Category: science
pkgname=('polylib' 'polylib-gmp')
pkgbase='polylib'
pkgver='5.22.8'
pkgrel=2
pkgdesc='A library of polyhedral functions'
arch=('x86_64')
url='http://icps.u-strasbg.fr/polylib/'
license=('GPL-3.0-or-later')
source=("http://icps.u-strasbg.fr/polylib/polylib_src/$pkgname-$pkgver.tar.gz"
        'fix-tests.patch')
sha256sums=('98b7578d13c374b7c88bd41ed753bbdeeb49f7bb71a75f0e8366797ae3dc800d'
            '8c51bb4e15ae4c4685dd53dbb0e0bf8ff89c7a98b79bd85ed3a1f03f821b1215')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"

    # resolves issues with testCompressParms functions being
    # defined after the main function...
    patch -p1 < $srcdir/fix-tests.patch
}

build() {
    cd "$srcdir/$pkgbase-$pkgver"

    msg "compiling normal version of Polylib"
    [ -d "polylib" ] || mkdir "polylib"
    cd polylib
    ../configure --prefix=/usr --without-libgmp
    make

    cd ..
    msg "compiling GMP version of Polylib"
    [ -d "polylibgmp" ] || mkdir "polylibgmp"
    cd polylibgmp
    ../configure --prefix=/usr --with-libgmp
    make
}

check() {
    cd "$srcdir/$pkgbase-$pkgver"

    cd polylib
    make check

    cd ../polylibgmp
    make check
}

package_polylib() {
    depends=('glibc')
    provides=('libpolylib32.so' 'libpolylib64.so')

    cd "$srcdir/$pkgbase-$pkgver/polylib"
    make DESTDIR="$pkgdir" install
}

package_polylib-gmp() {
    depends=('glibc' 'gmp' "polylib>=$pkgver")
    provides=('libpolylibgmp.so')

    cd "$srcdir/$pkgbase-$pkgver/polylibgmp"
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
