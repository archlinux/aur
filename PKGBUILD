# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-ura-git
_pkgname=${pkgname/-git}
pkgver=431.git.128dc53
pkgrel=3
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
"Makefile.patch"
"fetch-engine.patch"
# Information on how to obtain the following file is available at
# https://dev.maxmind.com/geoip/geoip2/geolite2/
"local://GeoLite2-Country.mmdb.gz"
"openra-ura"
"openra-ura.appdata.xml"
"openra-ura.desktop")
md5sums=('SKIP'
         'feae017ba5765215cd151a892362e6b1'
         '711019044fbb1c1e3aa5edc58b54343d'
         'efb8c043dfa095146f373fec367aef64'
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
    patch -Np1 -i $srcdir/fetch-engine.patch
}

build() {
    cd $srcdir/uRA
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/uRA
    mkdir -p $pkgdir/usr/{lib/openra-ura/mods,bin,share/pixmaps,share/doc/packages/openra-ura,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-ura
    chown 775 -R ${pkgdir}/var/games/openra-ura
    cp -r engine/{glsl,lua,AUTHORS,COPYING,*.dll*,GeoLite2-Country.mmdb.gz,'global mix database.dat',launch-dedicated.sh,launch-game.sh,*.exe,VERSION} $pkgdir/usr/lib/openra-ura
    cp -r mods/ura $pkgdir/usr/lib/openra-ura/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-ura/mods
    install -Dm755 $srcdir/openra-ura $pkgdir/usr/bin/openra-ura
    cp -r $srcdir/openra-ura.appdata.xml $pkgdir/usr/share/appdata/openra-ura.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-ura/README.md
    cp -r mods/ura/icon.png $pkgdir/usr/share/pixmaps/openra-ura.png
    install -Dm644 $srcdir/openra-ura.desktop $pkgdir/usr/share/applications/openra-ura.desktop
    rm $pkgdir/usr/lib/openra-ura/*.sh
}


