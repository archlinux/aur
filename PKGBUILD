# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>
pkgname=magic-git
pkgver=8.2.r713.bab2aa1
pkgrel=1
pkgdesc="A VLSI layout system"
url="http://opencircuitdesign.com/magic/"
arch=('i686' 'x86_64')
license=('custom:copyright')
provides=('magic')
conflicts=('magic')
depends=('tcl' 'tk' 'libx11')
makedepends=('git' 'tcsh')
optdepends=('mesa: for better graphics'
            'cairo: for better graphics'
            'glu: for better graphics'
            'blt: to create a tree diagram of the cell hierarchy in a design')
source=("git://opencircuitdesign.com/magic#branch=magic-8.2")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "8.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make -j1 DESTDIR="$pkgdir" MANDIR=/usr/share/man install
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    if [ -x /usr/bin/ps2ascii ]; then
        /usr/bin/ps2ascii "$pkgdir/usr/lib/magic/doc/copyright.ps" > "$pkgdir/usr/share/licenses/$pkgname/copyright"
    else
        install -m644 "$pkgdir/usr/lib/magic/doc/copyright.ps" "$pkgdir/usr/share/licenses/magic"
    fi
    mv "$pkgdir/usr/share/man/man1/extcheck.1" "$pkgdir/usr/share/man/man1/extcheck-magic.1"
}

