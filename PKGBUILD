# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-raclassic-git
_pkgname=${pkgname/-git}
pkgver=213.git.47c324e
pkgrel=1
pkgdesc="A mod of OpenRA that more faithfully recreates the Command & Conquer: Red Alert game"
arch=(x86_64)
url="https://github.com/OpenRA/raclassic"
license=('GPL3')
install=openra-raclassic.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'libxss' 'java-runtime'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('msbuild' 'dos2unix' 'git' 'unzip')
provides=('openra-raclassic')
options=(!strip)
source=("git+${url}.git"
"${_pkgname}"
"${_pkgname}.appdata.xml"
"${_pkgname}.desktop")
md5sums=('SKIP'
         'f13888474aeeb31acbe019d10d3d644c'
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
    make
    make version VERSION="${pkgver}"
}

package() {
    cd $srcdir/raclassic
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/${_pkgname},share/applications,share/appdata}
    cp -r mod.config $pkgdir/usr/lib/${_pkgname}
    sed -i -e "s|./engine\"|/usr/lib/${_pkgname}\"|g" $pkgdir/usr/lib/${_pkgname}/mod.config
    cp -r engine/{glsl,lua,AUTHORS,COPYING,'global mix database.dat',launch-dedicated.sh,launch-game.sh,bin,VERSION} $pkgdir/usr/lib/${_pkgname}
    cp -r mods/raclassic $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/mods/{common,modcontent,ra} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm755 $srcdir/${_pkgname} $pkgdir/usr/bin/${_pkgname}
    cp -r $srcdir/../${_pkgname}.appdata.xml $pkgdir/usr/share/appdata/${_pkgname}.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    ln -sf /usr/lib/${_pkgname}/mods/raclassic/icon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for length in 16 32 48 64 128 256; do
      size="${length}x${length}"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}
