pkgname=openra-yr-git
_pkgname=openra-yr
pkgver=374.git.3ec748c
pkgrel=1
pkgdesc="A Command & Conquer: Yuri's Revenge-inspired mod of OpenRA"
arch=('any')
url="https://github.com/cookgreen/Yuris-Revenge"
license=('GPL3')
install=openra-yr.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
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
    cd $srcdir/Yuris-Revenge
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/Yuris-Revenge
    dos2unix *.md
}

build() {
    cd $srcdir/Yuris-Revenge
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/Yuris-Revenge
    mkdir -p $pkgdir/usr/{lib/openra-yr/mods,bin,share/pixmaps,share/doc/packages/openra-yr,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-yr
    cp -r engine/* $pkgdir/usr/lib/openra-yr
    cp -r mods/yr $pkgdir/usr/lib/openra-yr/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-yr/mods
    install -Dm755 $srcdir/openra-yr $pkgdir/usr/bin/openra-yr
    cp -r $srcdir/openra-yr.appdata.xml $pkgdir/usr/share/appdata/openra-yr.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-yr/README.md
    cp -r mods/yr/icon.png $pkgdir/usr/share/pixmaps/openra-yr.png
    install -Dm644 $srcdir/openra-yr.desktop $pkgdir/usr/share/applications/openra-yr.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm -rf $pkgdir/usr/lib/openra-yr/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,.sh,Makefile,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/openra-yr/{mods/{all,cnc,d2k,ra,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Seyrer,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
