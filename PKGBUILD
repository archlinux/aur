# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=linrad
pkgver=04.06
pkgrel=1
pkgdesc="Software defined radio receiver for x11"
arch=('i686' 'x86_64')
url="http://www.sm5bsz.com/linuxdsp/linrad.htm"
license=('custom')
depends=('portaudio' 'libxext' 'libusb-compat' 'svgalib')
makedepends=('nasm' 'autoconf')
provides=('linrad', 'linrad-svga')
# Check the developer website for the latest version
source=(http://www.sm5bsz.com/linuxdsp/archive/lir${pkgver/./-}.tbz
              $pkgname.png
              $pkgname.desktop)
md5sums=('a3866d9041cb7fe19dc7a4b142cb61cd'
         '9e25fa8914f415a1d9f6d60801752b6a'
         '47578a7ca15fb9ab6e931f018c0db0ca')
sha1sums=('3d71170e8d14aeaef384eb1a63ad6f602aaf9df4'
          '6a39ed2cb87309c4810acb943ab4de6dc1512708'
          '517451f795e7ae45a073800fa04367ffec91ebc9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./clean
    autoreconf
    ./configure --prefix=/usr --datadir=/usr/share/$pkgname

    if [ "$(uname -m)" = "x86_64" ]; then
        make linrad64
        mv linrad64 linrad
        make xlinrad64
        mv xlinrad64 xlinrad
    else
        make linrad
        make xlinrad
    fi
}

package(){
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    cp -a $srcdir/$pkgname-$pkgver/*.txt $pkgdir/usr/share/doc/$pkgname
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -a $srcdir/$pkgname-$pkgver/*.lir $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/bin
    cp -a $srcdir/$pkgname-$pkgver/{,x}linrad $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/share/applications
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
# vim:set ts=2 sw=2 et:
