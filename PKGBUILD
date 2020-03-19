# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-ca-git
_pkgname=${pkgname/-git}
pkgver=90.git.30317b7
pkgrel=1
pkgdesc="A mod of OpenRA that combines units from the official Red Alert and Tiberian Dawn mods"
arch=('any')
url="https://github.com/Inq8/CAmod"
license=('GPL3')
install=openra-ca.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-ca')
options=(!strip)
source=("git+${url}.git"
"openra-ca"
"openra-ca.appdata.xml"
"openra-ca.desktop")
md5sums=('SKIP'
         'bdab27df863114bb7447839b9a75c0cf'
         '1fcf493eabd3fbd6d0ccd387ecc446e6'
         'fede5894ebe787ad39d8bdaac2efdc56')

pkgver() {
    cd $srcdir/CAmod
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/CAmod
    dos2unix *.md
}

build() {
    cd $srcdir/CAmod
    make version VERSION="${pkgver}"
    make
}

package() {
    cd $srcdir/CAmod
    mkdir -p $pkgdir/usr/{lib/openra-ca/mods,bin,share/pixmaps,share/doc/packages/openra-ca,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-ca
    cp -r engine/{glsl,lua,AUTHORS,COPYING,*.dll,*.dll.config,'global mix database.dat',launch*.sh,*.exe,VERSION} $pkgdir/usr/lib/openra-ca
    cp -r mods/ca $pkgdir/usr/lib/openra-ca/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-ca/mods
    install -Dm755 $srcdir/openra-ca $pkgdir/usr/bin/openra-ca
    cp -r $srcdir/openra-ca.appdata.xml $pkgdir/usr/share/appdata/openra-ca.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-ca/README.md
    cp -r packaging/artwork/icon_512x512.png $pkgdir/usr/share/pixmaps/openra-ca.png

    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512
    do
         install -Dm644 packaging/artwork/icon_${i}.png $pkgdir/usr/share/icons/hicolor/$i/apps/%{name}.png
    done

    install -Dm644 $srcdir/openra-ca.desktop $pkgdir/usr/share/applications/openra-ca.desktop
    rm $pkgdir/usr/lib/openra-ca/*.sh
}


