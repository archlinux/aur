# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-ura-git
_pkgname=${pkgname/-git}
pkgver=431.git.128dc53
pkgrel=1
pkgdesc="A Comamnd & Conquer: Red Alert-inspired mod of OpenRA"
arch=('any')
url="http://redalertunplugged.com/"
license=('GPL3')
install=openra-ura.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-ura')
options=(!strip)
source=("git+https://github.com/RAunplugged/uRA.git"
"openra-ura"
"openra-ura.appdata.xml"
"openra-ura.desktop")
md5sums=('SKIP'
         'e3cad77b684f1e8f8456e7b1e4b50cd1'
         '9f15794f7fb1bb9940cdb7c7f90f898a'
         '462aae2e4517dd55ef4e0dcafe0d4888')

pkgver() {
    cd $srcdir/uRA
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/uRA
    dos2unix *.md
    make version VERSION="${pkgver}"
}

build() {
    cd $srcdir/uRA
    make
}

package() {
    cd $srcdir/uRA
    mkdir -p $pkgdir/usr/{lib/openra-ura/mods,bin,share/pixmaps,share/doc/packages/openra-ura,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-ura
    chown 775 -R ${pkgdir}/var/games/openra-ura
    cp -r engine/{glsl,lua,AUTHORS,COPYING,Eluant.dll*,FuzzyLogicLibrary.dll,GeoLite2-Country.mmdb.gz,'global mix database.dat',ICSharpCode.SharpZipLib.dll,launch-dedicated.sh,launch-game.sh,MaxMind.Db.dll,OpenAL-CS.dll,OpenAL-CS.dll.config,Open.Nat.dll,OpenRA.Game.exe,OpenRA.Platforms.Default.dll,OpenRA.Server.exe,OpenRA.Utility.exe,rix0rrr.BeaconLib.dll,SDL2-CS.dll,SDL2-CS.dll.config,SharpFont.dll,SharpFont.dll.config,VERSION} $pkgdir/usr/lib/openra-ura
    cp -r mods/ura $pkgdir/usr/lib/openra-ura/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-ura/mods
    install -Dm755 $srcdir/openra-ura $pkgdir/usr/bin/openra-ura
    cp -r $srcdir/openra-ura.appdata.xml $pkgdir/usr/share/appdata/openra-ura.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-ura/README.md
    cp -r mods/ura/icon.png $pkgdir/usr/share/pixmaps/openra-ura.png
    install -Dm644 $srcdir/openra-ura.desktop $pkgdir/usr/share/applications/openra-ura.desktop
    rm $pkgdir/usr/lib/openra-ura/*.sh
}


