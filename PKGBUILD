# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=excellent-bifurcation
pkgver=0.0.20071015
pkgrel=4
pkgdesc="A shmup with an evil twist."
arch=('i686' 'x86_64')
url="http://www.allegro.cc/depot/ExcellentBifurcation"
_watch="none"
license=('GPL3')
depends=('allegro4' 'libxdg-basedir')
source=(http://ftp.de.debian.org/debian/pool/main/e/$pkgname/${pkgname}_$pkgver.orig.tar.gz
    http://ftp.de.debian.org/debian/pool/main/e/$pkgname/${pkgname}_$pkgver-6.debian.tar.xz)
md5sums=('de530c35c9bb678fb6abe55b84aeb235'
         '6948473edca3fe6cbaad4d5cfc136d21')

prepare() {
    cd "$srcdir/debian/patches"
    while read file
    do
        patch -d"$srcdir/$pkgname-$pkgver" -p1 < "$file"
    done < series
}

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    make CFLAGS="$CFLAGS -DDATA_DIR=\\\"/usr/share/$pkgname/\\\""
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 src/excellent-bifurcation "$pkgdir/usr/bin/$pkgname"
    install -Dm644 Readme.txt "$pkgdir/usr/share/$pkgname/README"
    install -Dm644 init.txt "$pkgdir/usr/share/$pkgname/init.txt"

    # assets
    cp -R wavs "$pkgdir/usr/share/$pkgname/"
    cp -R gfx  "$pkgdir/usr/share/$pkgname/"

    cd "$srcdir/debian"

    # menu entry
    install -Dm644 excellent-bifurcation.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 excellent-bifurcation.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"

    # manpage
    install -Dm644 excellent-bifurcation.6 "$pkgdir/usr/man/man6/$pkgname.6"
}



