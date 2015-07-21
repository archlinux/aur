# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>
pkgname=quisk
pkgver=3.7.1
pkgrel=1
pkgdesc="Software defined radio (SDR)"
arch=('i686' 'x86_64')
url="http://james.ahlstrom.name/quisk/"
license=('GPL')
depends=('python3' 'fftw' 'portaudio' 'wxpython')
source=(http://james.ahlstrom.name/quisk/$pkgname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop
        $pkgname.patch)
md5sums=('94d2f54e1592df2965757c21491b7471'
         '8a7445eee98db1f085dda69d606c5205'
         '44cddf20e06994ce3abcd4b563567ef3'
         'e369900227c9bea8d3bc68cb21838651')
sha512sums=('7b7a2f241f33306473fca809ef43a44e19a858126063995745d11717384db3d7f6d645d696e6fc71d5991f43e8db337c6fbfd21ac43681395fbe970973a64a9e'
            '94f09cc0e847e308ca66bf90c8f729924273f66524fed8bc63565c8060113ae8dcae6ed3f14075e03a7168da182059b3279c0315a1d2d00cf4292e4d68cf7871'
            '3ad02f730b4a4033b86a2ce510865c13c2f2e228304283cae0bb389442f7ab49a5d530cd94e32460e19b53da24037abc855027ce34c93fdabcd1faf8a91852b1'
            'a471e8ca91b598c825bcfb829bbcf32317596b5e88771c0eddc6558dfa8b1e0b0c0483344ba7cf95a8a231fdce1f8eb86e0a67603474d50ff2c0a978d1e5c099')
build() {
  # use python2 instead python for compilation
  cd $srcdir
  patch -p1 < $pkgname.patch

  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 quisk $pkgdir/opt/$pkgname/quisk
    cp -ra *.h $pkgdir/opt/$pkgname
    cp -ra *.c $pkgdir/opt/$pkgname
    cp -ra *.html $pkgdir/opt/$pkgname
    cp -ra *.py $pkgdir/opt/$pkgname
    cp -ra *.so $pkgdir/opt/$pkgname
    cp -ra *.txt $pkgdir/opt/$pkgname
    mv charleston "$pkgdir/opt/$pkgname"
    mv n2adr "$pkgdir/opt/$pkgname"
    mv sdriqpkg "$pkgdir/opt/$pkgname"
    mv softrock "$pkgdir/opt/$pkgname"
    mv usb "$pkgdir/opt/$pkgname"
    mv hiqsdr "$pkgdir/opt/$pkgname"
    find "$pkgdir/opt/$pkgname/" -type f  | xargs chmod 644
    find "$pkgdir/opt/$pkgname/" -type d | xargs chmod 755
    cd $srcdir
    mkdir -p $pkgdir/usr/share/applications
#   If the working directory is moved (e.g. from /opt to /home) 
#   the following .desktop file will have to be edited. Developer
#   has not provided a launcher icon.
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    echo -e "\n Quisk will be installed in the /opt directory of root \n"
    mkdir -p $pkgdir/usr/bin
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
