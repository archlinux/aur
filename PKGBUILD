# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=elibsrv
pkgver=20170325
pkgrel=1
pkgdesc="a light OPDS library server for EPUB and PDF ebooks"
arch=('x86_64' 'i686')
url="http://elibsrv.sourceforge.net/"
license=('GPL')
depends=('ebook-tools' 'php' 'sqlite' 'php-sqlite' 'php-gd' 'poppler')
optdepends=('kindlegen')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('2530853a48c542876eef719240d3bb3b28132e76090dbe56a902d80d2f08ddb2')

build() {
    cd "$pkgname-$pkgver/backend"
    make elibsrv
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/var/lib/elibsrv/cache"
    mkdir -p "$pkgdir/usr/share/webapps/elibsrv"
    mkdir -p "$pkgdir/usr/local/bin"
    mkdir -p "$pkgdir/etc"
    cp "backend/elibsrv" "$pkgdir/usr/local/bin/elibsrv"
    sed -i "/dbfile/c\dbfile = /var/lib/elibsrv/elibsrv.db" "etc/elibsrv.conf"
    sed -i "/thumbdir/c\thumbdir = /var/lib/elibsrv/cache" "etc/elibsrv.conf"
    sed -i "/kindlegen/c\kindlegen = /usr/bin/kindlegen" "etc/elibsrv.conf"
    touch "$pkgdir/var/lib/elibsrv.db"
    cp etc/elibsrv.conf "$pkgdir/etc/elibsrv.conf"
    cp -r frontend/* "$pkgdir/usr/share/webapps/elibsrv/"
}
