#
# Maintainer: Mark Barbone <mark.l.barbone at gmail>
# Co-maintainer: Thomas Hansen <thomas-e-hansen at teh6 dot eu>
# 

pkgname=idris2
pkgver=0.6.0
pkgrel=2
pkgdesc="Functional Programming Language with Dependent Types"
url="https://idris-lang.github.io/"
license=('custom')
arch=('x86_64')
depends=('chez-scheme')
optdepends=('nodejs: for the node backend'
            'racket: for the racket backend')
source=("https://www.idris-lang.org/idris2-src/idris2-${pkgver}.tgz")
sha256sums=('4db59312ed954778d135c78d8e41701bb37b1c4911a8f414a2074e87b246a153')

_srcname="Idris2-$pkgver"

build() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS # Parallel builds cause problems
    export SCHEME=chez

    mkdir -p "$srcdir/bootstrap"
    PREFIX="$srcdir/bootstrap" make bootstrap
    PREFIX="$srcdir/bootstrap" make install
    make clean

    PATH="$srcdir/bootstrap/bin:$PATH" \
        LD_LIBRARY_PATH="$srcdir/bootstrap/lib:$LD_LIBRARY_PATH" \
        PREFIX=/usr/lib \
        make all
}

check() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS
    export SCHEME=chez

    # TODO: next Idris2 release, when #2754 has been merged, re-enable all tests
    PATH="$srcdir/$_srcname/build/exec:$PATH" \
        make test INTERACTIVE="" except="base/system_info001"
}

package() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS
    export SCHEME=chez

    # Install compiler and runtime
    PREFIX="$pkgdir/usr/lib" make install-idris2
    PREFIX="$pkgdir/usr/lib" make install-support

    IDRIS2_BINARY="$srcdir/$_srcname/build/exec/idris2"

    # Install libraries
    install_lib() {
        IDRIS2_PREFIX="$pkgdir/usr/lib" \
            "$IDRIS2_BINARY" --install-with-src $1.ipkg
    }
    for lib in prelude base contrib linear network test ; do
        ( cd libs/$lib ; install_lib $lib )
    done
    install_lib idris2api

    # Clean up install
    mkdir -p "$pkgdir/usr/bin"
    mv "$pkgdir/usr/lib/bin/idris2_app/idris2.so" "$pkgdir/usr/bin/idris2"
    rm -r "$pkgdir/usr/lib/bin"
    mv "$pkgdir"/usr/lib/{lib/,}libidris2_support.so
    rmdir "$pkgdir"/usr/lib/lib

    # Fix permissions
    find "$pkgdir" -type d -exec chmod 755 {} \;

    install -Dm644 <("$IDRIS2_BINARY" --bash-completion-script idris2) \
        "$pkgdir/usr/share/bash-completion/completions/idris2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
