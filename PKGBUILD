pkgname=openra-dr-git
_pkgname=openra-dr
pkgver=324.git.ffcd6ba
pkgrel=1
pkgdesc="A Red Alert-inspired mod of OpenRA"
arch=('any')
url="https://www.openra.net"
license=('GPL3')
install=openra-dr.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-dr')
options=(!strip)
source=("git+https://github.com/drogoganor/DarkReign.git"
"openra-dr"
"openra-dr.appdata.xml"
"openra-dr.desktop")
md5sums=('SKIP'
         'd58a49e0348ab309c3f6b2e2659cf454'
         '331eabdd70606238705a80b1566ea932'
         'ac393c6822f0f3ed822b102f6cc1e16e')

pkgver() {
    cd $srcdir/DarkReign
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/DarkReign
    dos2unix *.md
    make version VERSION="Master commit ${pkgver}"
}

build() {
    cd $srcdir/DarkReign
    make
}

package() {
    cd $srcdir/DarkReign
    mkdir -p $pkgdir/usr/{lib/openra-dr/mods,bin,share/pixmaps,share/doc/packages/openra-dr,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-dr
    cp -r engine/{glsl,lua,AUTHORS,COPYING,Eluant.dll*,FuzzyLogicLibrary.dll,GeoLite2-Country.mmdb.gz,'global mix database.dat',ICSharpCode.SharpZipLib.dll,launch-dedicated.sh,launch-game.sh,MaxMind.Db.dll,OpenAL-CS.dll,OpenAL-CS.dll.config,Open.Nat.dll,OpenRA.Game.exe,OpenRA.Platforms.Default.dll,OpenRA.Server.exe,OpenRA.Utility.exe,rix0rrr.BeaconLib.dll,SDL2-CS.dll,SDL2-CS.dll.config,SharpFont.dll,SharpFont.dll.config,VERSION} $pkgdir/usr/lib/openra-dr
    cp -r mods/dr $pkgdir/usr/lib/openra-dr/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-dr/mods
    install -Dm755 $srcdir/openra-dr $pkgdir/usr/bin/openra-dr
    cp -r $srcdir/openra-dr.appdata.xml $pkgdir/usr/share/appdata/openra-dr.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-dr/README.md
    cp -r mods/dr/icon.png $pkgdir/usr/share/pixmaps/openra-dr.png
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done
    install -Dm644 $srcdir/openra-dr.desktop $pkgdir/usr/share/applications/openra-dr.desktop
    rm $pkgdir/usr/lib/openra-dr/*.sh
}


