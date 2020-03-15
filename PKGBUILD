# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-ra2-git
_pkgname=${pkgname/-git}
pkgver=985.git.cbe808b
pkgrel=1
pkgdesc="An OpenRA mod inspired by Command & Conquer: Red Alert 2 "
arch=('any')
url="https://github.com/OpenRA/ra2"
license=('GPL3')
install=openra-ra2.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-ra2')
options=(!strip)
source=("git+${url}.git"
"openra-ra2"
"openra-ra2.appdata.xml"
"openra-ra2.desktop")
md5sums=('SKIP'
         '868ef09a2ba5fd6907164fb740576c7e'
         '5f9d4e39293302ff69f7a701c870e635'
         '882b9d629dde1ecbcd2098a2e0b96b1b')

pkgver() {
    cd $srcdir/ra2
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/ra2
    dos2unix *.md
    chmod +x *.sh
}

build() {
    cd $srcdir/ra2
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/ra2
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/openra-ra2,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-ra2
    cp -r engine/{glsl,lua,AUTHORS,COPYING,*.dll*,GeoLite2-Country.mmdb.gz,'global mix database.dat',launch-dedicated.sh,launch-game.sh,*.exe,VERSION} $pkgdir/usr/lib/openra-ra2
    cp -r mods/ra2 $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm755 $srcdir/openra-ra2 $pkgdir/usr/bin/openra-ra2
    cp -r $srcdir/openra-ra2.appdata.xml $pkgdir/usr/share/appdata/openra-ra2.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    ln -sf /usr/lib/${_pkgname}/mods/ra2/logo.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    install -Dm644 $srcdir/openra-ra2.desktop $pkgdir/usr/share/applications/openra-ra2.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}
