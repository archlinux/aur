# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-sp-git
_pkgname=${pkgname/-git}
pkgver=357.git.94df9c2
pkgrel=1
pkgdesc="A Tiberian Sun-inspired mod of OpenRA"
arch=('any')
url="https://github.com/ABrandau/Shattered-Paradise-SDK"
license=('GPL3')
install=openra-sp.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-sp')
options=(!strip)
source=("git+https://github.com/ABrandau/Shattered-Paradise-SDK.git"
"openra-sp"
"openra-sp.appdata.xml"
"openra-sp.desktop")
md5sums=('SKIP'
         'f1cf30ba15c005526b2bbda106011c13'
         '9c765b2e005b0db03d569ccf679f323b'
         '451b5a8a2e603e2a140f8844461aff68')

pkgver() {
    cd $srcdir/Shattered-Paradise-SDK
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/Shattered-Paradise-SDK
    dos2unix *.md
    chmod +x *.sh
}

build() {
    cd $srcdir/Shattered-Paradise-SDK
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/Shattered-Paradise-SDK
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/openra-sp,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-sp
    cp -r engine/{glsl,lua,AUTHORS,COPYING,*.dll*,GeoLite2-Country.mmdb.gz,'global mix database.dat',launch-dedicated.sh,launch-game.sh,*.exe,VERSION} $pkgdir/usr/lib/openra-sp
    cp -r mods/sp $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/mods/{as,ts,common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm755 $srcdir/openra-sp $pkgdir/usr/bin/openra-sp
    cp -r $srcdir/openra-sp.appdata.xml $pkgdir/usr/share/appdata/openra-sp.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    install -Dm644 $srcdir/openra-sp.desktop $pkgdir/usr/share/applications/openra-sp.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}
