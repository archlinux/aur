# Maintainer: Max Sydorenko <maxsydorenko at gmail dot com>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>
pkgname=zygrib
_upname=zyGrib # upstream, case-sensitive project name
pkgver=8.0.1
pkgrel=3
pkgdesc="Weather data visualization, GRIB file viewer"
arch=('i686' 'x86_64')
url="https://www.zygrib.org/"
license=('GPL3')
depends=('qt5-base' 'qwt' 'bzip2' 'zlib>=1.2.3' 'proj>=4.6.0' 'ttf-liberation' 'libnova')
optdepends=('zygrib-maps: gshhs high-resolution maps from zygrib.org')
source=($_upname-$pkgver.tgz::https://www.zygrib.org/getfile.php?file=$_upname-$pkgver.tgz \
        zygrib.sh 
	zygrib.desktop
        zygrib.png)
sha256sums=('9c0490cbec74cea6d3c8f150bc745cb4c48f04969e10e91579fe01e56b9830f8'
            '57302878842678e4cc1f4fc25fac7f78ce87bfb24cfd7a46ccd9f99c6df32e5b'
            '2332353b1e681ffed5a189190c5ddf265336b064907cf2a0b085ba8d898a3ba1'
            '7f9034ad3a496d68cbc0e7423695840d525903e61bf8071b0db337db24e6141f')
# creative commons licence
DLAGENTS=('https::/usr/bin/curl -fLC - --cookie nada -o /dev/null %u --next --cookie nada  --retry-delay 3 -o %o %u')

prepare() {
	cd "$srcdir/$_upname-$pkgver"
	sed -Ei 's:(^.*image.inmem_=1.*$)://\1:' src/g2clib/enc_jpeg2000.c 
	if [ $CARCH == "i686" ]
	then
	    cd "$srcdir/$_upname-$pkgver"
	    sed -Ei 's:(^CFLAGS.*)-m64(.*)-D.*$:\1\2:' src/g2clib/makefile
	fi
}

build() {
  cd "$srcdir/$_upname-$pkgver"
  make INSTALLDIR=$pkgdir/opt/zygrib || return 1  
}

package() {
  install -d -m 755 $pkgdir/opt/$pkgname/{bin,data,data/colors,data/config,data/fonts/liberation-fonts,data/gis,data/img,data/maps/gshhs,data/stuff,data/tr}
  install -d -m 755 $pkgdir/usr/{bin,share/{applications,pixmaps}}
  install -D -m 755 $srcdir/zygrib.sh $pkgdir/usr/bin/zygrib
  install -D -m 644 $srcdir/zygrib.desktop $pkgdir/usr/share/applications
  install -D -m 644 $srcdir/zygrib.png $pkgdir/usr/share/pixmaps
  install -D -m 755 $srcdir/$_upname-$pkgver/src/$_upname $pkgdir/opt/$pkgname/bin
  install -D -m 644 $srcdir/$_upname-$pkgver/data/colors/* $pkgdir/opt/$pkgname/data/colors
install -D -m 644 $srcdir/$_upname-$pkgver/data/gis/* $pkgdir/opt/$pkgname/data/gis
install -D -m 644 $srcdir/$_upname-$pkgver/data/img/* $pkgdir/opt/$pkgname/data/img
install -D -m 644 $srcdir/$_upname-$pkgver/data/maps/gshhs/* $pkgdir/opt/$pkgname/data/maps/gshhs
install -D -m 644 $srcdir/$_upname-$pkgver/data/stuff/* $pkgdir/opt/$pkgname/data/stuff
install -D -m 644 $srcdir/$_upname-$pkgver/data/tr/* $pkgdir/opt/$pkgname/data/tr
}
