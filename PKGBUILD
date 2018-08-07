# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
# Contributor: Carl Rogers <carl.rogers@gmail.com>
pkgname='levmar-openmp'
pkgver=2.6
pkgrel=3
pkgdesc='Levenberg-Marquardt nonlinear least squares algorithms in C/C++ (OpenMP compatible)'
url='http://users.ics.forth.gr/~lourakis/levmar'
arch=('i686' 'x86_64')
license=('GPL')
depends=('f2c' 'lapack')
conflicts=('levmar')
provides=('levmar')
source=('http://users.ics.forth.gr/~lourakis/levmar/levmar-2.6.tgz')
md5sums=('16bc34efa1617219f241eef06427f13f')

# Fool the server.
DLAGENTS=('http::/usr/bin/curl -A not_a_bot -fLC - --retry 3 --retry-delay 3 -o %o %u')

build() {
    # Adapted from Debian packaging by Daniil Ivanov.
    cd levmar-$pkgver
    mkdir -p sobj
    # actually use LIBS, not just define them
    sed -i 's/#-llapack -lblas -lf2c/$\(LIBS\)/' Makefile.so
    # add math library to LIBS
    sed -i 's/-llapack -lblas -lf2c #/-llapack -lblas -lf2c -lm #/' Makefile.so
    # move end line comments to a separate line
    sed -i 's/\(.*\) #\(.*\)/#\2\n\1/' Makefile.so
    # Make OpenMP compatible
    sed -i '/^#define LINSOLVERS_RETAIN_MEMORY$/d' levmar.h levmar.h.in
    make -f Makefile.so
}

package() {
    cd levmar-$pkgver
    install -Dpm 755 sobj/liblevmar.so.2.2 $pkgdir/usr/lib/liblevmar.so.2.2
    install -Dpm 644 levmar.h $pkgdir/usr/include/levmar/levmar.h
    ln -rs $pkgdir/usr/lib/liblevmar.so.2{.2,}
    ln -rs $pkgdir/usr/lib/liblevmar.so{.2.2,}
}
