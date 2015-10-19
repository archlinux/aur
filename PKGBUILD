# Maintainer : Jamin Collins <jamin.collins@gmail.com>

pkgname=gnomint
pkgver=1.2.1
pkgrel=3
pkgdesc='A x509 Certification Authority management tool for GTK/Gnome'
arch=('i686' 'x86_64')
url="http://gnomint.sourceforge.net"
license=('GPLv3')
depends=('intltool>=0.23' 'sqlite3' 'libgnomeui' 'gnutls>=3' 'libtasn1' 'libgcrypt')
makedepends=('patch' 'gnutls>=3')

source=("http://downloads.sourceforge.net/project/gnomint/gnomint/${pkgver}/gnomint-${pkgver}.tar.gz"
        "gnutls3.patch"
        "configure.patch"
        "Makefile.in.patch")

md5sums=('f09f55abe094232fbea2a2d13ef600e6'
         '4871f56b52bcaa732183c2989d74e362'
         '2121d32289a051f9305e4ce938230dbf'
         'a3daedfd564b282f07bb473e100a09b0')

package() {
    cd $srcdir/$pkgname-$pkgver
    patch ./configure < $startdir/configure.patch || return 1
    CFLAGS="-I/usr/gnutls2/include" LDFLAGS="-L/usr/gnutls2/lib" ./configure --prefix=/usr --sysconfdir=/etc
    patch src/Makefile.in < $startdir/Makefile.in.patch || return 1
    make || return 1
    make DESTDIR=$pkgdir install
}

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i $srcdir/gnutls3.patch
}
