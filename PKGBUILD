# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=use
pkgver=1.12.2
pkgrel=1
pkgdesc='A utility to help casual user install multiple versions of a software package'
url='http://use.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('glibc')
makedepends=('gcc' 'glibc' 'make' 'coreutils' 'perl' 'sed')
source=("use-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/use/Version%20${pkgver}/use.d.tar.gz"
${pkgname}.patch
)
sha256sums=('bcc782919636f1581cea409ed54b08d4a0a9119eae26f7856a3e128278360b7b'
            '86f33d0304ba9897c942b86cecb765c1192c9848dc3cf9647281c6802a7c8603')


build() {
    cd "$srcdir/use.d"
    patch --strip=1 < ../${pkgname}.patch
    ./configure.pl <<EOF
//usr/share
/usr/bin
/usr/share/man/man1
EOF
    sed -i 's:\${INSTALL_:-- "\${DESTDIR}"&:g' Makefile.mk
    sed -i 's|-Werror|-Wno-error|g' Makefile.mk
    make
    sed -i 's:/usr/local/:/usr/:g' use.1 use.*sh
}

package () {
    cd "$srcdir/use.d"
    mkdir -p -- "$pkgdir/usr/bin"
    mkdir -p -- "$pkgdir/usr/share/man/man1"
    make install DESTDIR="$pkgdir"
}

