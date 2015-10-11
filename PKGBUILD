# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>
pkgname=quisk
pkgver=3.7.7
pkgrel=1
pkgdesc="Software defined radio (SDR)"
arch=('i686' 'x86_64')
url="http://james.ahlstrom.name/quisk/"
license=('GPL')
depends=('python2' 'fftw' 'portaudio' 'wxpython')
source=(http://james.ahlstrom.name/quisk/$pkgname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop
        $pkgname.patch)
md5sums=('12b6a450d856b5c2421dc5c40723b664'
         '8a7445eee98db1f085dda69d606c5205'
         '44cddf20e06994ce3abcd4b563567ef3'
         '17c74b3cbdf22715aad32e2259b013d5')
sha512sums=('385cac3579a7ebdb3c94082761adbc16d9a41e50feae8b0b49779cd0c5edc39fa2aca962d668426b5ad6144ebaf48f84991d455cd2eec349951f3d567f9cc741'
            '94f09cc0e847e308ca66bf90c8f729924273f66524fed8bc63565c8060113ae8dcae6ed3f14075e03a7168da182059b3279c0315a1d2d00cf4292e4d68cf7871'
            '3ad02f730b4a4033b86a2ce510865c13c2f2e228304283cae0bb389442f7ab49a5d530cd94e32460e19b53da24037abc855027ce34c93fdabcd1faf8a91852b1'
            'fb487bddbe3449e4afaf62041bb4eaf005f9c4b9da856df6c69b5fbcf4f59b53f72ab3566b49ec663d7ddd3c5af8029267f5fef8440e62695ddfdc21edf0f6fa')
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
