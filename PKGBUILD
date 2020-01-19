# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-raclassic-git
_pkgname=${pkgname/-git}
pkgver=189.git.a199fec
pkgrel=1
pkgdesc="A mod of OpenRA that more faithfully recreates the Command & Conquer: Red Alert game"
arch=('any')
url="https://github.com/OpenRA/raclassic"
license=('GPL3')
install=openra-raclassic.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-raclassic')
options=(!strip)
source=("git+${url}.git"
"${_pkgname}"
"${_pkgname}.appdata.xml"
"${_pkgname}.desktop")
md5sums=('SKIP'
         'a12b558a94aaf9046466acb26c5fb851'
         '86cb505318478eff0ffbd3bd49bbca2e'
         '0f6a6f3b2e76bad0dea522668d8cffbb')

pkgver() {
    cd $srcdir/raclassic
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/raclassic
    dos2unix *.md
    chmod +x *.sh
}

build() {
    cd $srcdir/raclassic
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/raclassic
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/openra-raclassic,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-raclassic
    cp -r engine/{glsl,lua,AUTHORS,COPYING,GeoLite2-Country.mmdb.gz,'global mix database.dat',launch-dedicated.sh,launch-game.sh,OpenRA*.exe,*.dll*,VERSION} $pkgdir/usr/lib/openra-raclassic
    cp -r mods/raclassic $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/mods/{common,modcontent,ra} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm755 $srcdir/openra-raclassic $pkgdir/usr/bin/openra-raclassic
    cp -r $srcdir/openra-raclassic.appdata.xml $pkgdir/usr/share/appdata/openra-raclassic.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    ln -sf /usr/lib/${_pkgname}/mods/raclassic/icon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    install -Dm644 $srcdir/openra-raclassic.desktop $pkgdir/usr/share/applications/openra-raclassic.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}
