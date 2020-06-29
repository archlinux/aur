#
# Maintainer: Mark Barbone <mark.l.barbone at gmail>
# 

pkgname=idris2-git
pkgver=0.2.0.r404.g31b486c
pkgrel=1
pkgdesc="Funtional Programming Lanugage with Dependent Types"
url="https://www.idris-lang.org/"
license=('custom')
arch=('x86_64')
depends=('chez-scheme')
makedepends=('git')
provides=('idris2')
conflicts=('idris2')
source=('git+https://github.com/idris-lang/Idris2.git')
md5sums=('SKIP')

_srcname="Idris2"

pkgver() {
    cd $_srcname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_srcname"

    # Parallel builds cause problems
    unset MAKEFLAGS

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
