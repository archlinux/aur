# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-ra2-git
_pkgname=${pkgname/-git}
pkgver=1104.git.e655ada
pkgrel=1
pkgdesc="An OpenRA mod inspired by Command & Conquer: Red Alert 2 "
arch=('any')
url="https://github.com/OpenRA/ra2"
license=('GPL3')
install=openra-ra2.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild' 'openra-git')
provides=('openra-ra2')
options=(!strip)
source=("git+${url}.git"
"openra-ra2"
"openra-ra2.appdata.xml"
"openra-ra2.desktop")
md5sums=('SKIP'
         '719ee2e7604b36d45cd5fe2c15cfd8e4'
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
    
    if [ ! -e $srcdir/ra2/engine ]; then
    if [ -e "/usr/lib/openra/src/openra-git/" ]; then
     ln -s "/usr/lib/openra/src/openra-git" $srcdir/ra2/engine
     RAVERSION=$(cat $srcdir/ra2/mod.config | grep "ENGINE_VERSION" | head -1 | sed -e 's|=|\n|g;s|"||g' | tail -1)
     GITVER=$(cat /usr/lib/openra/src/openra-git/VERSION)
     if [ ! "$RAVERSION" == "$GITVER" ]; then
        sed -e "s|$RAVERSION|$GITVER|g" $srcdir/ra2/mod.config
     fi
     if [ ! $srcdir/ra2/user.config ]; then
        echo 'AUTOMATIC_ENGINE_MANAGEMENT="False"' > $srcdir/ra2/user.config 
     fi
    else
     echo "openra-git is not installed; exiting." && exit 1;
    fi
    fi
}

build() {
    cd $srcdir/ra2
    make all
}

package() {
    cd $srcdir/ra2
    mkdir -p $pkgdir/usr/{lib/openra/mods,bin,share/appdata,share/pixmaps,share/applications}
    install -dm775 $pkgdir/usr/lib/openra/mods/ra2
    cp -r mods/ra2 $pkgdir/usr/lib/openra/mods
    install -Dm755 $srcdir/openra-ra2 $pkgdir/usr/bin/openra-ra2
    cp -r $srcdir/openra-ra2.appdata.xml $pkgdir/usr/share/appdata/openra-ra2.appdata.xml
#    cp $srcdir/ra2/packaging/artwork/icon_512x512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/openra-ra2.png
    ln -sf /usr/share/icons/hicolor/512x512/apps/openra-ra2.png ${pkgdir}/usr/share/pixmaps/openra-ra2.png
    install -Dm644 $srcdir/openra-ra2.desktop $pkgdir/usr/share/applications/openra-ra2.desktop
    for size in 16 32 48 64 128 256 512 1024; do
      size="${size}x${size}"
      mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}/apps"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/openra-ra2.png"
    done
}
