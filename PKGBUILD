# Maintainer: Leonidas <marek@xivilization.net>
pkgname=factor
pkgver=0.97
pkgrel=1
pkgdesc="A general purpose, dynamically typed, stack-based programming language."
arch=(i686 x86_64)
url="http://factorcode.org"
license=(BSD)
provides=(factor)
conflicts=(factor-git)
depends=(gtkglext)
options=(!strip)
source=(http://downloads.factorcode.org/releases/$pkgver/$pkgname-src-$pkgver.zip
        factor.desktop
        factor.svg
        fuel-factor-vm.patch)
sha512sums=('44eed6304e15be26267abcc8f78b576bfc4da979bae61faf48c1ddbd72cad7bad1b61b342c49bd297b12d78d577834242d321a2f6d451cba86273dffbeb4bf85'
            '19cf98d0fce2f1f65db4d3416c9577aa5e1f9c5829fab8f722756d37d4683caf3c740669ba895660a66177b6b38e3c7a30153ca70a515e91a455b83c4a55a026'
            '4065a22cd10873f74024655aa71aafa2b96c0e391f61a5e71f5f4fac9b49955428528c2666da5e6e5058aa28347b0f9327575f2467baf9e3914739b8fa0b2c26'
            '743b7d1332acc9863968686b2182bc9e9fa91822abd8c3b63a7933480b014dce15e86bb69201695186af26a6b267705e0618f131632249b2c3872d85a1973b07')

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
    make
    # bootstrap factor with the minimum supported SSE
    ./factor -i=$_bootimg -sse-version=$_sseversion
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib/factor
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/

    # copy over the stdlib
    cd $srcdir/$pkgname
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
    install -D "$srcdir/factor.svg" "$pkgdir/usr/share/pixmaps/factor.svg"
}
