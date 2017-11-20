# Maintainer: Jean Jouve <jean-18-09@hotmail.fr>
pkgname=camllight
pkgver=0.75
pkgrel=2
pkgdesc="Compiler for caml light source code"
arch=('i686' 'x86_64')
url='http://caml.inria.fr/'
license=('custom:INRIA')
depends=('sh')
makedepends=('gcc' 'sh')
source=('http://caml.inria.fr/pub/distrib/caml-light-0.75//cl75unix.tar.gz')
md5sums=('6c236074e4487949ec22001c7a498057')
validpgpkeys=()

prepare() {
    cd 'cl75/src'
    sed -i 's/CPP=\/lib\/cpp/CPP=\/usr\/bin\/cpp -P -traditional -Dunix/' Makefile
    sed -i 's/BINDIR=\/usr\/local\/bin/BINDIR=\/usr\/bin/' Makefile
    sed -i 's/LIBDIR=\/usr\/local\/lib/LIBDIR=\/usr\/lib/' Makefile
    sed -i 's/MANDIR=\/usr\/local\/man/MANDIR=\/usr\/share\/man/' Makefile
}

build() {
	cd 'cl75/src'
    make configure
    make world
}

check() {
    cd 'cl75/src'
    make bootstrap
}

package() {
    #make install doesn't create any of the required directory
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/caml-light
    mkdir -p $pkgdir/usr/share/man/man1

    #Install the license
    cd 'cl75'
    install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    #Install camllight
	cd 'src'
	make BINDIR="$pkgdir/usr/bin"\
        LIBDIR="$pkgdir/usr/lib/caml-light"\
        MANDIR="$pkgdir/usr/share/man/man1"\
        install
    
    #Patch built executables' header
    sed -i "s/${pkgdir//\//\\/}//" $pkgdir/usr/lib/caml-light/header
 
}
