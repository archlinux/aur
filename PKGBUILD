# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: Marcelo Alaniz <malaniz@code4life.com.ar>

pkgname=nusmv
_pkgname=NuSMV
pkgver=2.5.4
pkgrel=2
pkgdesc="A new symbolic model checker"
arch=('i686' 'x86_64')
url="http://nusmv.irst.itc.it/$_pkgname/"
license=('LGPL2.1')
depends=('expat')
makedepends=('ghostscript')
optdepends=('perl: for scripts in /usr/share/nusmv/contrib/')
source=("http://nusmv.fbk.eu/distrib/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3c250624cba801b1f62f50733f9507b0f3b3ca557ce1cd65956178eb273f1bdf')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Should be only one cudd-* directory, * being whatever the bundled version of cudd is
    cd ./cudd-*
    # Use arch-specific makefile for cudd
    if [ "$CARCH" == "x86_64" ]
    then
        mv Makefile Makefile_32bit
        ln -s Makefile_64bit Makefile
    fi

    # Fix missing DESTDIR in doc makefile paths
    cd "../$pkgname/doc/"
    find "./" -mindepth 2 -name 'Makefile.in' -not -path "./html/*" | xargs sed -i -e 's/$(datadir)/$(DESTDIR)$(datadir)/'
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Should be only one cudd-* directory, * being whatever the bundled version of cudd is
    cd "./cudd-"*
    make

    cd "../$pkgname"
    ./configure --prefix="/usr"
    # Work around compilation hang when -O2 is active
    make CFLAGS="$CFLAGS -O1"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    cd "./$pkgname"
    make DESTDIR="$pkgdir/" install

    # Fix srcdir ref
    sed -r -e 's,^(cudddir=).*/(cudd-[0-9.]+/?)$,\1/usr/include/\2,' -i "$pkgdir/usr/lib/pkgconfig/nusmv-2.pc"

    # Lowercase symlink
    ln -s "/usr/bin/NuSMV" "$pkgdir/usr/bin/nusmv"
}
