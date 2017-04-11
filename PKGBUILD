# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=bearlibterminal-hg
pkgver=r405.fba5b22c197f
pkgrel=1
pkgdesc='BearLibTerminal is a library that creates a terminal-like window facilitating flexible textual output and uncomplicated input processing.'
arch=('i686' 'x86_64')
url='http://foo.wyrd.name/en:bearlibterminal'
license=('MIT')
makedepends=('mercurial' 'cmake' 'python-setuptools' 'python2-setuptools')
provides=('bearlibterminal')
source=('bearlibterminal-hg::hg+https://bitbucket.org/cfyzium/bearlibterminal')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$srcdir/$pkgname/Build"

    cmake ..
    make
}

package() {
    # C shared library & header
    cd "$srcdir/$pkgname"
    SOLIB="Output/Linux64/libBearLibTerminal.so" 
    INCDIR="Terminal/Include"
    install -Dm644 "$SOLIB" "$pkgdir/usr/lib/libBearLibTerminal.so"
    install -Dm644 "$INCDIR/C/BearLibTerminal.h" "$pkgdir/usr/include/BearLibTerminal.h"

    # And python library
    cp CHANGELOG.md "$INCDIR/Python"
    cp "$SOLIB" "$INCDIR/Python/bearlibterminal/"
    cd "$INCDIR/Python"
    python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1

    # TODO: other languages?
}
