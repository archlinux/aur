# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
pkgname=libfprint-upstream-git
pkgver=0.6.0.r43.5a7e6e0
pkgrel=2
pkgdesc='Library for fingerprint readers'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/fprint/libfprint/'
license=('LGPL')
depends=('libusb' 'nss' 'pixman' 'glib2')
makedepends=('git')
provides=('libfprint')
conflicts=('libfprint')
source=("$pkgname::git://anongit.freedesktop.org/libfprint/libfprint"
        '0001-uru4k-increase-threshold-to-detect-encryption.patch')
md5sums=('SKIP'
         '91b54db5734ba1e9e58ec348ea381da2')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --long | sed 's/^V_//;s/\([^-]*-\)g/r\1/;s/[-_]/./g')"
}

prepare() {
    cd "$srcdir/$pkgname"

    # uru4000 devices won't work with upstream git, see bug report #88945:
    # https://bugs.freedesktop.org/show_bug.cgi?id=88945
    # There is a fix, but it was not committed upstream. Uncomment this line to
    # apply the patch for this build:
    #patch -Np1 -i "$srcdir/0001-uru4k-increase-threshold-to-detect-encryption.patch"

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-static

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="$pkgdir" install
}
