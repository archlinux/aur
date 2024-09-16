# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Leonidas <marek@xivilization.net>
pkgname=factor
pkgver=0.100
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
sha512sums=('7a653ca646f499944d91b5a584883da025dccde2e0a065d353a80c85cd2959f6c2380fed8b091431a4ec7aadbcbacd2b39206074ddb6f8570f48758f3ab35da7'
            '19cf98d0fce2f1f65db4d3416c9577aa5e1f9c5829fab8f722756d37d4683caf3c740669ba895660a66177b6b38e3c7a30153ca70a515e91a455b83c4a55a026'
            '4065a22cd10873f74024655aa71aafa2b96c0e391f61a5e71f5f4fac9b49955428528c2666da5e6e5058aa28347b0f9327575f2467baf9e3914739b8fa0b2c26'
            '743b7d1332acc9863968686b2182bc9e9fa91822abd8c3b63a7933480b014dce15e86bb69201695186af26a6b267705e0618f131632249b2c3872d85a1973b07')
prepare() {
    cd $pkgname
    # apply patches
    patch -p1 < $srcdir/fuel-factor-vm.patch
}

build() {
    cd $pkgname

    # build the VM
    make

    # thanks to qx from #concatenative for the proper SSE settings:
    # i686: no SSE, x87 floating point => -sse-version=0
    # x86_64: SSE2 => (autodetect) -sse-version=20
    if [ $CARCH = x86_64 ]; then
        ./factor -i="boot.unix-x86.64.image"
    else
        # bootstrap factor with the minimum supported SSE
        ./factor -i="boot.unix-x86.32.image" -sse-version=0
    fi
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
    chmod -x LICENSE.txt
    cp LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING

    # add the desktop entry
    install -D "$srcdir/factor.desktop" "$pkgdir/usr/share/applications/factor.desktop"
    install -D "$srcdir/factor.svg" "$pkgdir/usr/share/pixmaps/factor.svg"
}

