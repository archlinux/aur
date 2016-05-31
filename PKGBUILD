# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>
pkgname=quisk
pkgver=4.0.5
pkgrel=3
pkgdesc="Software defined radio (SDR)"
arch=('i686' 'x86_64')
url="http://james.ahlstrom.name/quisk/"
license=('GPL')
depends=('python2' 'fftw' 'portaudio' 'wxpython')
optdepends=('codec2: Enable digital voice communication with FreeDV')
source=(http://james.ahlstrom.name/quisk/$pkgname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop
        $pkgname.patch)
sha512sums=('9def5a9899642603302d02436be610054118ca91716374f197bfe4b23a6f4615a08d14f3335b07d4b63aa517b138bd28bf94b32bff83609020a697b6f85bca1b'
            '94f09cc0e847e308ca66bf90c8f729924273f66524fed8bc63565c8060113ae8dcae6ed3f14075e03a7168da182059b3279c0315a1d2d00cf4292e4d68cf7871'
            '3ad02f730b4a4033b86a2ce510865c13c2f2e228304283cae0bb389442f7ab49a5d530cd94e32460e19b53da24037abc855027ce34c93fdabcd1faf8a91852b1'
            'f614cf152e263bd3a67e442d37fc072ed25293a1879817b0c37266c4da8900e1477421bb408b334cba903d29126474f892bf6c8d04a102ae8a788f1c233a5b04')
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
