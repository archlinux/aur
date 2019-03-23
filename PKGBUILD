pkgname=openra-rv-git
_pkgname=openra-rv
pkgver=1624.git.7f5be71
pkgrel=1
pkgdesc="A Romanov's Vengeance-inspired mod of OpenRA, warning you will need the original Red Alert 2 game (Ultimate Edition) assets to play this game"
arch=('any')
url="https://www.openra.net"
license=('GPL3')
install=openra-rv.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-rv')
options=(!strip)
source=("git+https://github.com/MustaphaTR/Romanovs-Vengeance.git"
"openra-rv"
"openra-rv.appdata.xml"
"openra-rv.desktop")
md5sums=('SKIP'
         '80198a3797c5f4103536702d15e37f19'
         '8bc1150ba694cb3e1a8bcadee4ef75ce'
         '98c237db6df1eb777658842765948ea2')

pkgver() {
    cd $srcdir/Romanovs-Vengeance
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/Romanovs-Vengeance
    dos2unix *.md
    printf "Success in converting docs...\n"
    make version VERSION="Master commit ${pkgver}"
    printf "Success in setting version\n"
}

build() {
    cd $srcdir/Romanovs-Vengeance
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at https://github.com/MustaphaTR/Romanovs-Vengeance/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/Romanovs-Vengeance
    mkdir -p $pkgdir/usr/{lib/openra-rv/mods,bin,share/pixmaps,share/doc/packages/openra-rv,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-rv
    cp -r engine/{glsl,lua,AUTHORS,COPYING,Eluant.dll*,FuzzyLogicLibrary.dll,GeoLite2-Country.mmdb.gz,'global mix database.dat',ICSharpCode.SharpZipLib.dll,launch-dedicated.sh,launch-game.sh,MaxMind.Db.dll,OpenAL-CS.dll,OpenAL-CS.dll.config,Open.Nat.dll,OpenRA.Game.exe,OpenRA.Platforms.Default.dll,OpenRA.Server.exe,OpenRA.Utility.exe,rix0rrr.BeaconLib.dll,SDL2-CS.dll,SDL2-CS.dll.config,SharpFont.dll,SharpFont.dll.config,VERSION} $pkgdir/usr/lib/openra-rv
    cp -r mods/rv $pkgdir/usr/lib/openra-rv/mods
    cp -r engine/mods/{as,common,modcontent} $pkgdir/usr/lib/openra-rv/mods
    install -Dm755 $srcdir/openra-rv $pkgdir/usr/bin/openra-rv
    cp -r $srcdir/openra-rv.appdata.xml $pkgdir/usr/share/appdata/openra-rv.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-rv/README.md
    cp -r mods/rv/logo.png $pkgdir/usr/share/pixmaps/openra-rv.png
    install -Dm644 $srcdir/openra-rv.desktop $pkgdir/usr/share/applications/openra-rv.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm $pkgdir/usr/lib/openra-rv/*.sh
}
