# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=blastem
pkgver=0.6.2
_srcver=8aeac7bd9fa7
pkgrel=2
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator"
arch=('x86_64')
url="https://www.retrodev.com/blastem/changes.html"
license=('GPL3')
depends=('sdl2' 'glew')
makedepends=('python2-pillow')
optdepends=('vasm: game selection menu (must rebuild)'
            'xcftools: game selection menu (must rebuild)')
source=("$pkgname-$pkgver.tar.gz::https://www.retrodev.com/repos/blastem/archive/$_srcver.tar.gz"
        'menu.patch')
sha1sums=('1953ebfd0eaf5e5630ff5488779eb8e6bb8fe9bf'
          '9336fcf3ee45f3861838d4633a74de6b6392a2fe')

prepare() {
    cd $pkgname-$_srcver
    patch -Np1 -i "$srcdir/menu.patch"
    chmod a+x menumake.sh install.sh
    #GCC10 workaround
    perl -pi -e 's|(CFLAGS:=)(-std=gnu99.*)|\1-fcommon \2|g' Makefile
}

build() {
    cd $pkgname-$_srcver
    make blastem
    ./menumake.sh
}

package() {
    cd $pkgname-$_srcver
    ./install.sh
    mkdir -p "$pkgdir/opt/blastem"
    install -d -g games "$pkgdir/opt/blastem"
    install -m 755 -g games -D to_install/* "$pkgdir/opt/blastem"
    install -m 666 -g games -D default.cfg "$pkgdir/opt/blastem"
    install -m 666 -g games rom.db gamecontrollerdb.txt "$pkgdir/opt/blastem"
    install -m 644 -g games -d "$pkgdir/opt/blastem/shaders"
    install -m 644 -g games -D shaders/* "$pkgdir/opt/blastem/shaders"
    chmod 755 "$pkgdir/opt/blastem/blastem"
    chown root:games "$pkgdir/opt/blastem"
    chown root:games "$pkgdir/opt/blastem/shaders"
    chmod 755 "$pkgdir/opt/blastem/shaders"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/blastem/blastem" "$pkgdir/usr/bin/blastem"
}
