# Maintainer: Victor Schulz <schulz89@gmail.com>
pkgname=scv
pkgver=2.0.1
pkgrel=1
pkgdesc="SystemC verification library"
arch=('x86_64' 'i686')
url="http://www.accellera.org/downloads/standards/systemc"
license=('Apache License Version 2.0, January 2004')
depends=('systemc')
provides=('scv')
source=("http://www.accellera.org/images/downloads/standards/systemc/$pkgname-$pkgver.tar.gz")
md5sums=('c8791df7ec64a91d04daa418b77bae2b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p objdir
    cd objdir
    ../configure --with-systemc=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/objdir"
    make DESTDIR="$pkgdir/" install
    cd ..
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Manually fixing documentation directories, see Makefile:
    # FIXME: handle $docdir and/or $docdatadir
    cd "$pkgdir/usr"
    mkdir -p share/doc/$pkgname
    mv *.scv share/doc/$pkgname/
    mv docs/scv/* share/doc/$pkgname/
    rmdir -p docs/scv
    mv examples/scv share/doc/$pkgname/examples
    rmdir examples
}
