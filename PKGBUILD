#
# Maintainer: Mark Barbone <mark.l.barbone at gmail>
# 

pkgname=idris2
pkgver=0.3.0
pkgrel=1
pkgdesc="Funtional Programming Lanugage with Dependent Types"
url="https://www.idris-lang.org/"
license=('custom')
arch=('x86_64')
depends=('chez-scheme')
makedepends=('git')
source=("https://www.idris-lang.org/idris2-src/idris2-${pkgver}.tgz")
sha256sums=('5be811e6327d3473dd84d4b498b78ab4046defed1063f28ac60dcd41aa229ec3')

_srcname="Idris2-$pkgver"

build() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS # Parallel builds cause problems
    export SCHEME=scheme

    mkdir -p "$srcdir/bootstrap"
    PREFIX="$srcdir/bootstrap" make bootstrap
    PREFIX="$srcdir/bootstrap" make install
    make clean

    PATH="$srcdir/bootstrap/bin:$PATH" \
        LD_LIBRARY_PATH="$srcdir/bootstrap/lib:$LD_LIBRARY_PATH" \
        PREFIX=/usr/lib \
        make
}

package() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS
    export SCHEME=scheme

    PREFIX="$pkgdir/usr/lib" make install-idris2
    PREFIX="$pkgdir/usr/lib" make install-support
    for lib in prelude base contrib network ; do
        cd libs/$lib
        IDRIS2_PREFIX="$pkgdir/usr/lib" ../../build/exec/idris2 --install $lib.ipkg
        cd ../..
    done

    # clean up install
    mkdir -p "$pkgdir/usr/bin"
    mv "$pkgdir/usr/lib/bin/idris2_app/idris2.so" "$pkgdir/usr/bin/idris2"
    rm -r "$pkgdir/usr/lib/bin"
    mv "$pkgdir"/usr/lib/{lib/,}libidris2_support.so
    rmdir "$pkgdir"/usr/lib/lib

    # Fix permissions
    find "$pkgdir" -type d -exec chmod 755 {} \;

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
