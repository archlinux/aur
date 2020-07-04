pkgname=openra-mw-git
_pkgname=${pkgname/-git}
pkgver=274.git.8c9f6d6
pkgrel=1
pkgdesc="An mod of OpenRA depicting medieval warfare"
arch=('any')
url="https://github.com/CombinE88/Medieval-Warfare"
license=('GPL3')
install=openra-mw.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-mw')
options=(!strip)
source=("git+${url}.git"
"${_pkgname}"
"openra-mw.appdata.xml"
"openra-mw.desktop")
md5sums=('SKIP'
         'e0a97ba9134ed19d29cf61bf44c9b0ee'
         '0f77c0a5b31dbcf523e985d27c438788'
         '2410c10bc2fce972a940f734471db5a1')

pkgver() {
    cd $srcdir/Medieval-Warfare
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/Medieval-Warfare
    dos2unix *.md
}

build() {
    cd $srcdir/Medieval-Warfare
    make version VERSION="${pkgver}"
    make || ( printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at ${url}/issues/new, after checking\n" && \
	printf "for existing issues.\n" )
}

package() {
    cd $srcdir/Medieval-Warfare
    mkdir -p $pkgdir/usr/{lib/openra-mw/mods,bin,share/pixmaps,share/doc/packages/openra-mw,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-mw
    cp -r engine/{glsl,lua,AUTHORS,COPYING,Eluant.dll*,FuzzyLogicLibrary.dll,GeoLite2-Country.mmdb.gz,'global mix database.dat',ICSharpCode.SharpZipLib.dll,launch-dedicated.sh,launch-game.sh,MaxMind.Db.dll,OpenAL-CS.dll,OpenAL-CS.dll.config,Open.Nat.dll,OpenRA.Game.exe,OpenRA.Platforms.Default.dll,OpenRA.Server.exe,OpenRA.Utility.exe,rix0rrr.BeaconLib.dll,SDL2-CS.dll,SDL2-CS.dll.config,SharpFont.dll,SharpFont.dll.config,VERSION} $pkgdir/usr/lib/openra-mw
    cp -r mods/mw $pkgdir/usr/lib/openra-mw/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-mw/mods
    install -Dm755 $srcdir/openra-mw $pkgdir/usr/bin/openra-mw
    cp -r $srcdir/openra-mw.appdata.xml $pkgdir/usr/share/appdata/openra-mw.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-mw/README.md
    cp -r mods/mw/icon.png $pkgdir/usr/share/pixmaps/openra-mw.png
    install -Dm644 $srcdir/openra-mw.desktop $pkgdir/usr/share/applications/openra-mw.desktop
    rm $pkgdir/usr/lib/openra-mw/*.sh
}


