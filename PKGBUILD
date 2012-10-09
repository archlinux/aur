# Maintainer: Leonidas <marek@xivilization.net>
pkgname=factor
pkgver=0.95
pkgrel=2
pkgdesc="Factor is a general purpose, dynamically typed, stack-based programming language."
arch=(i686 x86_64)
url="http://factorcode.org"
license=(BSD)
provides=(factor)
conflicts=(factor-git)
depends=(pango cairo glib2 freetype2 mesa libgl gtkglext)
options=(!strip)
source=(http://downloads.factorcode.org/releases/$pkgver/$pkgname-src-$pkgver.zip
        factor.desktop
        factor.png
        fuel-factor-vm.patch)
md5sums=('4122978b522a95a2b2348f5915b0cf07'
         '59242ddb19a9be927915e489e2bfca27'
         '74512251d922434c3a973f06800d6181'
         '9d297a5b9dd60ec51d91068e82939474')

build() {
    # thanks to qx from #concatenative for the proper SSE settings:
    # i686: no SSE, x87 floating point => _sseversion=0
    # x86_64: SSE2 => _sseversion=20
    _bootimg="boot.unix-x86.32.image"
    # unfortunately, factor 0.94 needs SSE2 to run, so this needs to be
    # set (temporarily?) to SSE2
    _sseversion=20
    [ $CARCH = x86_64 ] && _bootimg="boot.unix-x86.64.image" && _sseversion=20

    cd $srcdir/$pkgname
    # apply patches
    patch -p1 < $srcdir/fuel-factor-vm.patch

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

    # copy over the actual binary and create a symlink called factor-vm
    # (otherwise it conflicts with factor from the GNU coreutils)
    cp -a factor $pkgdir/usr/lib/factor/factor
    cd $pkgdir/usr/bin
    ln -s ../lib/factor/factor factor-vm
    cd -

    # copy over the license (as defined in Arch Packaging Standards)
    chmod -x license.txt
    cp license.txt $pkgdir/usr/share/licenses/$pkgname/COPYING

    # add the desktop entry
    install -D "$srcdir/factor.desktop" "$pkgdir/usr/share/applications/factor.desktop"
    install -D "$srcdir/factor.png" "$pkgdir/usr/share/pixmaps/factor.png"
}
