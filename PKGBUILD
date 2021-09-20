# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Lukas Sabota <lukas@lwsabota.com>
pkgname=blastem-hg
pkgver=r2040.a61b47d5489e
pkgrel=1
pkgdesc="Fast and accurate Sega Genesis/Mega Drive emulator"
arch=('x86_64')
url="http://rhope.retrodev.com/files/blastem.html"
license=('GPLv3')
depends=('sdl2' 'glew')
makedepends=('mercurial' 'python2-pillow' 'vasm' 'xcftools')
provides=('blastem')
conflicts=('blastem')
source=(blastem::hg+http://rhope.retrodev.com/repos/blastem
        'menu.patch')
sha256sums=('SKIP'
            '9c5a6b77b20c221bdbd1f274d3ace8ed25bdc5678840c4985acc605d43203af5')

pkgver() {
    cd $srcdir/${pkgname%-hg}
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)" | sed s/+//g
}

prepare() {
    cd "$srcdir/${pkgname%-hg}"
    patch -Np1 -i "${srcdir}/menu.patch"
}

build() {
    cd "$srcdir/${pkgname%-hg}"
    make blastem
    make menu.bin
}

package() {
    cd "$srcdir/${pkgname%-hg}"
    mkdir -p "$pkgdir/opt/blastem"
    install -d -g games "$pkgdir/opt/blastem"
    install -m 755 -g games -D blastem "$pkgdir/opt/blastem"
    install -m 666 -g games -D default.cfg "$pkgdir/opt/blastem"
    install -m 666 -g games -D systems.cfg "$pkgdir/opt/blastem"
    install -m 666 -g games rom.db gamecontrollerdb.txt "$pkgdir/opt/blastem"
    install -m 644 -g games -d "$pkgdir/opt/blastem/shaders"
    install -m 644 -g games -D shaders/* "$pkgdir/opt/blastem/shaders"
    install -m 644 -g games -D menu.bin "$pkgdir/opt/blastem"
    chmod 755 "$pkgdir/opt/blastem/blastem"
    chown root:games "$pkgdir/opt/blastem"
    chown root:games "$pkgdir/opt/blastem/shaders"
    chmod 755 "$pkgdir/opt/blastem/shaders"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/blastem/blastem" "$pkgdir/usr/bin/blastem"
}
