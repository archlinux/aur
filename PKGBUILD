# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=libtai
pkgver=0.60
pkgrel=1
epoch=
pkgdesc="a library for storing and manipulating dates and times"
arch=(x86_64)
url="https://cr.yp.to/libtai.html"
license=('Unlicense')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"$pkgname-$pkgver.tar.gz::https://cr.yp.to/libtai/libtai-$pkgver.tar.gz"
conf-cc.patch
)
noextract=()
sha256sums=(
06dc42ccb77aee681fbd0e0754fc2180e1e9aeaa650838e9d74933d447a3d219
4be83e30680b292d3ff0d2e29e4e88f9b7900508eb1ed73b2675f20e62035655
)
validpgpkeys=()
OPTIONS=(staticlibs)

prepare() {
	cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/conf-cc.patch"
}

build() {
	cd "$pkgname-$pkgver"

    # make static lib, helper programs
	make $MAKEFLAGS

    # make shared library
    if [[ -z "$CC" ]]; then
        CC=gcc
    fi
    echo Making shared library...
    ${CC} -shared \
    -o "libtai.$pkgver.so" \
    tai_add.o tai_now.o tai_pack.o \
	tai_sub.o tai_unpack.o taia_add.o taia_approx.o \
	taia_fmtfrac.o taia_frac.o taia_half.o taia_less.o \
	taia_now.o taia_pack.o taia_sub.o taia_tai.o taia_unpack.o \
	caldate_fmt.o caldate_scan.o caldate_fmjd.o caldate_mjd.o \
	caldate_norm.o caldate_ster.o leapsecs_read.o \
	leapsecs_init.o leapsecs_add.o leapsecs_sub.o caltime_fmt.o \
	caltime_scan.o caltime_tai.o caltime_utc.o
}

package() {
	cd "$pkgname-$pkgver"

    # static library
    install -D -m444 libtai.a "$pkgdir/usr/lib/libtai.a"
    # shared library
    install -D -m444 libtai.$pkgver.so "$pkgdir/usr/lib/libtai.$pkgver.so"
    ln -s /usr/lib/libtai.$pkgver.so "$pkgdir/usr/lib/libtai.0.so"
    ln -s /usr/lib/libtai.0.so "$pkgdir/usr/lib/libtai.so"

    # headers
    install -D -m444 tai.h "$pkgdir/usr/include/tai.h"
    install -D -m444 uint64.h "$pkgdir/usr/include/uint64.h"
    install -D -m444 taia.h "$pkgdir/usr/include/taia.h"
    install -D -m444 caldate.h "$pkgdir/usr/include/caldate.h"
    install -D -m444 caltime.h "$pkgdir/usr/include/caltime.h"
    install -D -m444 leapsecs.h "$pkgdir/usr/include/leapsecs.h"

    # account for leap-seconds
    install -D -m644 leapsecs.dat "$pkgdir/etc/leapsecs.dat"

    # man pages
    install -D -m444 tai.3 "$pkgdir/usr/share/man/man3/tai.3"
    install -D -m444 tai_now.3 "$pkgdir/usr/share/man/man3/tai_now.3"
    install -D -m444 tai_pack.3 "$pkgdir/usr/share/man/man3/tai_pack.3"
    install -D -m444 taia.3 "$pkgdir/usr/share/man/man3/taia.3"
    install -D -m444 taia_now.3 "$pkgdir/usr/share/man/man3/taia_now.3"
    install -D -m444 taia_pack.3 "$pkgdir/usr/share/man/man3/taia_pack.3"
    install -D -m444 caldate.3 "$pkgdir/usr/share/man/man3/caldate.3"
    install -D -m444 caldate_mjd.3 "$pkgdir/usr/share/man/man3/caldate_mjd.3"
    install -D -m444 caltime.3 "$pkgdir/usr/share/man/man3/caltime.3"
    install -D -m444 caltime_tai.3 "$pkgdir/usr/share/man/man3/caltime_tai.3"
    install -D -m444 leapsecs.3 "$pkgdir/usr/share/man/man3/leapsecs.3"

    # programs
    install -D -m555 leapsecs "$pkgdir/usr/bin/tai-leapsecs"
    install -D -m555 check "$pkgdir/usr/bin/tai-check"
    install -D -m555 easter "$pkgdir/usr/bin/tai-easter"
    install -D -m555 yearcal "$pkgdir/usr/bin/tai-yearcal"
    install -D -m555 nowutc "$pkgdir/usr/bin/tai-nowutc"
}
