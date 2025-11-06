#
# Maintainer: Mark Barbone <mark.l.barbone at gmail>
# Co-maintainer: Thomas Hansen <thomas-e-hansen at teh6 dot eu>
# 

pkgname=idris2
pkgver=0.8.0
pkgrel=1
pkgdesc="Functional Programming Language with Dependent Types"
url="https://idris-lang.github.io/"
license=('BSD-3-Clause')
arch=('x86_64')
depends=('chez-scheme' 'gmp')
optdepends=('nodejs: for the node backend'
            'racket: for the racket backend')
source=("https://www.idris-lang.org/releases/idris2-${pkgver}.tgz")
sha256sums=('940a283cb66b0097cab0d24fe10341274fab75cb3af58dc715944d6ca7230665')

_srcname="Idris2-$pkgver"

build() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS # Parallel builds cause problems
    export SCHEME=chez

    mkdir -p "$srcdir/bootstrap"
    PREFIX="$srcdir/bootstrap" make bootstrap
    PREFIX="$srcdir/bootstrap" make install
    make distclean

    PATH="$srcdir/bootstrap/bin:$PATH" \
        PREFIX=/usr/lib \
        make all
}

check() {
    cd "$srcdir/$_srcname"

    unset MAKEFLAGS
    export SCHEME=chez

    # The refc backend tests contains a bunch of unused variables, presumably
    # they're actually used for FFI things and this is just impossible to
    # statically spot.
    export CFLAGS="-Wno-error=unused-variable ${CFLAGS}"

    PATH="$srcdir/$_srcname/build/exec:$PATH" \
        LC_ALL=C make test INTERACTIVE=""
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

    # Fix permissions
    find "$pkgdir" -type d -exec chmod 755 {} \;

    install -Dm644 <("$IDRIS2_BINARY" --bash-completion-script idris2) \
        "$pkgdir/usr/share/bash-completion/completions/idris2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Put a symlink to executable in the expected place
    # (see: man 7 file-hierarchy)
    mkdir "$pkgdir/usr/bin"
    ln -s "/usr/lib/bin/idris2" "$pkgdir/usr/bin/idris2"
}
