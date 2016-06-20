# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=linrad
pkgver=04.10
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
sha512sums=('98e986fe61a238d2b9a67f09176ad649129f1d9c740807d49be7cb848c79ec9ced78d57f1ba7ac39a6037efe89afbf6593206d006f1e0443ae496464668ed936'
            '463d107e1732a35c53d23da32af93e1c18fa2e04d7977a1649ee06ac6a8ea5c11191102e51d124afc033ee038e63fdca2756e42de72b56b567b6b47a7b4e350f'
            'f89ad218e4e02dd6502397509da443a44a51689078587913898de29d392e32b33348536fab09a23c7964abdc9349b146ef24b699f3d5d9a457a9a5eec4906f16')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./clean
    autoreconf
    ./configure --prefix=${pkgdir} --datadir=/usr/share/${pkgname}
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
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
