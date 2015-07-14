# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=xcolorsel
pkgver=1.1a
_debver=17
pkgrel=2
pkgdesc="display and grab colors in X"
arch=(i686 x86_64)
url="http://packages.debian.org/stable/x11/xcolorsel"
license=('GPL')
depends=(libxaw)
makedepends=(imake)
source=(http://ftp.de.debian.org/debian/pool/main/x/xcolorsel/xcolorsel_$pkgver.orig.tar.gz
        http://ftp.de.debian.org/debian/pool/main/x/xcolorsel/xcolorsel_$pkgver-$_debver.diff.gz
        'rgb.txt::http://cvsweb.xfree86.org/cvsweb/*checkout*/xc/programs/rgb/rgb.txt?rev=HEAD&content-type=text/plain')
md5sums=('6833bdf1c49d21e7681dc9df0829da0e'
         'cae579a5bc36697d2fa768a129581923'
         '26273ff2170258797478318c30a40b9b')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  zcat "$srcdir/${pkgname}_$pkgver-$_debver.diff.gz" | patch -p1
  sed -i -e "s:/etc/X11/rgb.txt:/usr/share/xcolorsel/rgb.txt:" RgbText.c
  sed -i -e "s:Xaw3d:Xaw:" *.[ch]

  xmkmf -a -DHasSELinux=0
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  install -D -m755 xcolorsel "${pkgdir}/usr/bin/xcolorsel"
  install -D -m644 xcolorsel.man "${pkgdir}/usr/share/man/man1/xcolorsel.1"
  install -D -m644 Xcolorsel.ad "${pkgdir}/usr/share/X11/app-defaults/Xcolorsel"
  install -D -m644 Xcolorsel-color.ad "${pkgdir}/usr/share/X11/app-defaults/Xcolorsel-color"

  install -D -m644 "$srcdir/rgb.txt" "${pkgdir}/usr/share/xcolorsel/rgb.txt"
}

# vim:set ts=2 sw=2 et:
