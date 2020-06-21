# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-kknd-git
_pkgname=openra-kknd
pkgver=281.git.d094389
pkgrel=1
pkgdesc="A Krush, Kill n' Destroy-inspired mod of OpenRA"
arch=('any')
url="https://www.kknd-game.com/"
license=('GPL3')
install=${_pkgname}.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=("${_pkgname}")
options=(!strip)
source=("git+https://github.com/IceReaper/KKnD.git"
"${_pkgname}"
"${_pkgname}.appdata.xml"
"${_pkgname}.desktop")
md5sums=('SKIP'
         '97e2915c76fed6ddc325652bbc03daa6'
         'c5f78612c8da1e25119bd13c14989a14'
         'bca1c5bd8363910c329041cafcb784d5')

pkgver() {
    cd $srcdir/KKnD
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/KKnD
    dos2unix *.md
    printf "Success in converting docs...\n"
    make version VERSION="${pkgver}"
    printf "Success in setting version\n"
}

build() {
    cd $srcdir/KKnD
    make
}

package() {
    cd $srcdir/KKnD
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/${_pkgname},share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/${_pkgname}
    cp -r engine/{glsl,lua,AUTHORS,COPYING,*.dll*,'global mix database.dat',launch-dedicated.sh,launch-game.sh,*.exe,VERSION} $pkgdir/usr/lib/${_pkgname}
    cp -r mods/*kknd* $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm755 $srcdir/${_pkgname} $pkgdir/usr/bin/${_pkgname}
    cp -r $srcdir/${_pkgname}.appdata.xml $pkgdir/usr/share/appdata/${_pkgname}.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256,512x512}/apps
    for size in 16 32 48 64 128 256 512; do
      size="${size}x${size}"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done
    install -Dm644 packaging/artwork/icon_512x512.png "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}
