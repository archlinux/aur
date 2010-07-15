# Maintainer: Leonidas <marek@xivilization.net>
pkgname=factor
pkgver=0.93
pkgrel=3
pkgdesc="Factor is a general purpose, dynamically typed, stack-based programming language."
arch=(i686 x86_64)
url="http://factorcode.org"
license=(BSD)
provides=(factor)
conflicts=(factor-git)
depends=(pango cairo glib2 freetype2 mesa libgl)
options=(!strip)
source=(http://downloads.factorcode.org/releases/$pkgver/$pkgname-src-$pkgver.zip
        factor-vm
        factor.desktop)
md5sums=('d5507d193e3b8c22e4d0be1a4a213934'
         '172985592832c63157888bce652c273c'
         '14d41133811f4f9359c76bbdc6902e03')

build() {
    # thanks to qx from #concatenative for the proper SSE settings:
    # i686: no SSE, x87 floating point
    # x86_64: SSE2
    _bootimg="boot.unix-x86.32.image"
    _sseversion=0
    [ $CARCH = x86_64 ] && _bootimg="boot.unix-x86.64.image" && _sseversion=20

    cd $srcdir/$pkgname
    # build the VM
    make || return 1
    # bootstrap factor with the minimum supported SSE
    ./factor -i=$_bootimg -sse-version=$_sseversion

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib/factor
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/

    # copy over the stdlib
    cp -a misc extra core basis factor.image $pkgdir/usr/lib/factor/
    # make folders r+x and files r
    chmod -R 0755 $pkgdir/usr/lib/factor
    find $pkgdir/usr/lib/factor -type f -exec chmod -x {} \;

    # copy over the actual binary
    cp -a factor $pkgdir/usr/bin/factor-bin
    # copy over the wrapper that calls factor with the proper image
    cp $srcdir/factor-vm $pkgdir/usr/bin/factor-vm
    chmod +x $pkgdir/usr/bin/factor-vm
    # copy over the license (as defined in Arch Packaging Standards)
    chmod -x license.txt
    cp license.txt $pkgdir/usr/share/licenses/$pkgname/COPYING

    # add the desktop entry
    install -D "$srcdir/factor.desktop" "$pkgdir/usr/share/applications/factor.desktop"
}
