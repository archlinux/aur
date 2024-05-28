pkgname=saytime
pkgver=1.0
pkgrel=35
pkgdesc="speaks the current time through your sound card"
arch=('x86_64')
url="http://www.acme.com/software/saytime/"
license=('GPL')
depends=('sox')
source=(http://deb.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        https://ftp.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.debian.tar.xz)
md5sums=('9e251909ca6c38757a6da4f24c608b6e' '26692aba8640aeac5cd9a27591b167bb')

prepare() {
    cd "$srcdir"
    tar -xf "${pkgname}_${pkgver}.orig.tar.gz"
    tar -xf "${pkgname}_${pkgver}-${pkgrel}.debian.tar.xz"
    cd "$srcdir/${pkgname}-${pkgver}.orig"
    for patch in $(cat "$srcdir/debian/patches/series"); do
        patch -p1 -i "$srcdir/debian/patches/$patch"
    done
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}.orig"
    make
    install -D -m755 "$srcdir/${pkgname}-${pkgver}.orig/saytime" "$pkgdir/usr/bin/saytime"
    install -d -m755 "$pkgdir/usr/share/saytime"
    install -m644 "$srcdir/${pkgname}-${pkgver}.orig/sounds/"* "$pkgdir/usr/share/saytime"
}
