# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=use
pkgver=1.12.1
pkgrel=1
pkgdesc='A utility to help casual user install multiple versions of a software package'
url='http://use.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('glibc')
makedepends=('gcc' 'glibc' 'make' 'coreutils' 'perl' 'sed')
source=("use-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/use/Version%20${pkgver}/use.d.tar.gz")
sha256sums=('9efd990bd3e2cf40e74e56ecb7f849e5050e69aa24317633adbe2e1ce360efbe')


build() {
    cd "$srcdir/use.d"
    ./configure.pl <<EOF
/etc
/usr/bin
/usr/share/man/man1
EOF
    sed -i 's:\${INSTALL_:-- "\${DESTDIR}"&:g' Makefile.mk
    make
    sed -i 's:/usr/local/:/usr/:g' use.1 use.*sh
    sed -i 's:/usr/share/use.table:/etc/use.table:g' use.1
}

package () {
    cd "$srcdir/use.d"
    mkdir -p -- "$pkgdir/etc"
    mkdir -p -- "$pkgdir/usr/bin"
    mkdir -p -- "$pkgdir/usr/share/man/man1"
    make install DESTDIR="$pkgdir"
}

