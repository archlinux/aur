# Maintainer: blu256 <mfilippos@yandex.ru>

pkgname=wmsolar-git
pkgver=r2.37b9014
pkgrel=2
pkgdesc="A dockapp depicting the solar system (90 deg. heliocentric)"
url=""https://github.com/engerim42/wmsolar
license=('GPL')
arch=('i686' 'x86_64')
depends=('libxpm' 'gcc-libs')
makedepends=('git' 'make' 'ed')
provides=('wmsolar')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

    # The following because we need to use an older C++ standard
    ed Makefile <<EOF
38c
	install -c -s -m 0755 wmSolar \$(DESTDIR)/usr/bin/
.
2c
CFLAGS = -O2 -Wall -std=c++03
.
w Makefile
q
EOF

    # The following edits in Lunar.h and PlanetData.cpp
    # fix an error when trying to initialize a double
    # floating point constant in-class.
    ed Lunar.h <<EOF
66c
    static const double SYNODIC_MONTH;
.
w Lunar.h
q
EOF
    ed PlanetData.cpp <<EOF
20a
const double  Lunar::SYNODIC_MONTH = 29.530588861;

.
w PlanetData.cpp
q
EOF

    # At last, build it!
	make all
}

package() {
	cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" install
    echo 'Warning: the executable is called wmSolar.'
}
