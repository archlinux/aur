# Maintainer: Mark Barbone <mark.l.barbone at gmail>
# Contributor: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=idris2
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='A purely functional programming language with first class types'
url='https://www.idris-lang.org/'
license=('custom')
arch=('x86_64')
depends=('chez-scheme')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/idris-lang/${_pkgname^}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    export MAKEFLAGS+=' -j1 '
    export SCHEME=chez

    BOOTSTRAP="$srcdir/bootstrap"
    export PATH="$BOOTSTRAP/bin:$PATH"
    export LD_LIBRARY_PATH="$BOOSTRAP/lib:$LD_LIBRARY_PATH"

    mkdir -p "$BOOTSTRAP"
    PREFIX="$BOOTSTRAP" make bootstrap
    PREFIX="$BOOTSTRAP" make install

    make clean
    PREFIX="/usr/lib" make all
}

check() {
    cd "$srcdir/$_pkgname"

    export MAKEFLAGS+=' -j1 '
    export SCHEME=chez

    BOOTSTRAP="$srcdir/bootstrap"
    PATH="$BOOTSTRAP/bin:$PATH"
    LD_LIBRARY_PATH="$BOOSTRAP/lib:$PATH"

    PREFIX="$BOOTSTRAP" IDRIS2_PREFIX="$PREFIX" make install
    PREFIX="$BOOTSTRAP" IDRIS2_PREFIX="$PREFIX" make test
}

package() {
    cd "$srcdir/$_pkgname"

    export MAKEFLAGS+=' -j1 '
    export SCHEME=chez

    BOOTSTRAP="$srcdir/bootstrap"
    export PREFIX="$pkgdir/usr/lib"
    export IDRIS2_PREFIX="$PREFIX"
    PATH="/usr/lib/bin:$PREFIX/bin:$BOOTSTRAP/bin:$PATH"
    LD_LIBRARY_PATH="/usr/lib/lib:$PREFIX/lib:$BOOSTRAP/lib:$LD_LIBRARY_PATH"

    make install
    make install-libdocs
    make install-api

    mkdir -p "$pkgdir/usr/bin"
    mv "$pkgdir/usr/lib/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    sed -i 's|$DIR|/usr/lib|g' "$pkgdir/usr/bin/$_pkgname"

    mv "$pkgdir/usr/lib/bin/${_pkgname}_app" "$pkgdir/usr/lib/${_pkgname}_app"
    rmdir "$pkgdir/usr/lib/bin"

    mv "$pkgdir/usr/lib/lib/"* "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib/lib"

    rm "$pkgdir/usr/lib/libidris2_support.so"
    install "support/c/libidris2_support.a" "$pkgdir/usr/lib/$_pkgname-"*"/lib"

    install -Dm644 <(idris2 --bash-completion-script idris2) \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
