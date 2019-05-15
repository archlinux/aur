pkgname=openra-yr-git
_pkgname=openra-yr
pkgver=199.git.5b8b952
pkgrel=1
pkgdesc="A Command & Conquer: Yuri's Revenge-inspired mod of OpenRA"
arch=('any')
url="https://github.com/cookgreen/yr"
license=('GPL3')
install=openra-yr.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-yr')
options=(!strip)
source=("git+${url}.git"
"openra-yr"
"openra-yr.appdata.xml"
"openra-yr.desktop")
md5sums=('SKIP'
         '9ddf56b241cd992d455ee3c7b602382b'
         '51b3883b5f26625f30256a13cb729ea5'
         '3be388e2b2fb8b8c33b2e5f3232e9cda')

pkgver() {
    cd $srcdir/yr
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/yr
    dos2unix *.md
}

build() {
    cd $srcdir/yr
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/yr
    mkdir -p $pkgdir/usr/{lib/openra-yr/mods,bin,share/pixmaps,share/doc/packages/openra-yr,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-yr
    cp -r engine/{glsl,lua,AUTHORS,COPYING,Eluant.dll*,FuzzyLogicLibrary.dll,GeoLite2-Country.mmdb.gz,'global mix database.dat',ICSharpCode.SharpZipLib.dll,launch-dedicated.sh,launch-game.sh,MaxMind.Db.dll,OpenAL-CS.dll,OpenAL-CS.dll.config,Open.Nat.dll,OpenRA.Game.exe,OpenRA.Platforms.Default.dll,OpenRA.Server.exe,OpenRA.Utility.exe,rix0rrr.BeaconLib.dll,SDL2-CS.dll,SDL2-CS.dll.config,SharpFont.dll,SharpFont.dll.config,VERSION} $pkgdir/usr/lib/openra-yr
    cp -r mods/yr $pkgdir/usr/lib/openra-yr/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-yr/mods
    install -Dm755 $srcdir/openra-yr $pkgdir/usr/bin/openra-yr
    cp -r $srcdir/openra-yr.appdata.xml $pkgdir/usr/share/appdata/openra-yr.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-yr/README.md
    cp -r mods/yr/icon.png $pkgdir/usr/share/pixmaps/openra-yr.png
    install -Dm644 $srcdir/openra-yr.desktop $pkgdir/usr/share/applications/openra-yr.desktop
    rm $pkgdir/usr/lib/openra-yr/*.sh
}
