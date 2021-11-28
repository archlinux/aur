# Maintainer: trap000d <trap000d at gmail dot com>

pkgname=gridwars-git
pkgver=r13.e760698
pkgrel=2
pkgdesc="Grid Wars 2: A clone of Geometry Wars"
_bmver="0.129.3.45"
_srcname="GridWars"
arch=('x86_64')
url="https://github.com/mmatyas/GridWars"
license=('GPL')
depends=('libglvnd' 'libxdmcp' 'libxxf86vm' 'libxau' 'libxft' 'libx11' 'glu')
makedepends=('git')
source=("https://github.com/bmx-ng/bmx-ng/releases/download/v${_bmver}.linux.x64/BlitzMax_linux_x64_0.129.3.45.tar.xz"
        "git+https://github.com/mmatyas/GridWars.git"
        "gridwars.desktop")
sha256sums=('635108f2b93d654934ae2baf15698082e2f21f070d6872da8e42bb9d4e331447'
            'SKIP'
            '2ad4d272c2d4696b27eb3f8c5bff3b9d0c540703680124796c147cbf11eabb8e')

pkgver() {
    cd ${srcdir}/${_srcname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export PATH=${srcdir}/BlitzMax/bin:$PATH
    cd ${srcdir}/${_srcname}
    bmk makeapp -t gui -r -w gridwars.bmx
}

package() {

    #Creating Directories
    install -m755 -d $pkgdir/usr/{bin,share/{applications,pixmaps,games/gridwars/{gfx/{high,med,low,solid,user},music,sounds}}}

    # Installing
    install -D -m755 $srcdir/${_srcname}/gridwars $pkgdir/usr/share/games/gridwars/
    install -D -m644 $srcdir/${_srcname}/gfx/colourpick.png $pkgdir/usr/share/games/gridwars/gfx/colourpick.png
    for i in high low med solid user; do
        install -D -m644 $srcdir/${_srcname}/gfx/$i/* $pkgdir/usr/share/games/gridwars/gfx/$i
    done
    install -D -m644 $srcdir/${_srcname}/music/* $pkgdir/usr/share/games/gridwars/music/
    install -D -m644 $srcdir/${_srcname}/sounds/* $pkgdir/usr/share/games/gridwars/sounds/
    install -D -m644 $srcdir/gridwars.desktop $pkgdir/usr/share/applications/gridwars.desktop
    install -D -m644 $srcdir/${_srcname}/gfx/high/whiteplayer.png $pkgdir/usr/share/pixmaps/gridwars.png

    # Linking binary and stuff
    ln -sf /usr/share/games/gridwars/gridwars $pkgdir/usr/bin/gridwars
}
