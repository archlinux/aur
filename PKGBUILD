# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-rv-git
_pkgname=openra-rv
pkgver=3959.git.66c9a08
pkgrel=1
pkgdesc="A Command & Conquer: Red Alert 2-inspired mod of OpenRA"
arch=(x86_64)
url="https://github.com/MustaphaTR/Romanovs-Vengeance"
license=('GPL3')
install=openra-rv.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'libxss' 'java-runtime'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-rv')
options=(!strip)
source=("git+${url}.git"
"openra-rv"
"openra-rv.appdata.xml"
"openra-rv.desktop")
md5sums=('SKIP'
         'f13888474aeeb31acbe019d10d3d644c'
         'cdade4bc4fcba3ea1d3dea6bd0e9a2c9'
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
}

build() {
    cd $srcdir/Romanovs-Vengeance
    make
    make version VERSION="${pkgver}"
    printf "Success in setting version\n" 
}

package() {
    cd $srcdir/Romanovs-Vengeance
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/${_pkgname},share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/${_pkgname}
    cp -r engine/* $pkgdir/usr/lib/${_pkgname}
    cp -r mods/rv $pkgdir/usr/lib/${_pkgname}/mods
    cp -r mod.config $pkgdir/usr/lib/${_pkgname}
    sed -i -e "s|./engine\"|/usr/lib/${_pkgname}\"|g" $pkgdir/usr/lib/${_pkgname}/mod.config
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/{glsl,lua,AUTHORS,COPYING,'global mix database.dat',VERSION} $pkgdir/usr/lib/${_pkgname}
    install -Dm755 $srcdir/${_pkgname} $pkgdir/usr/bin/${_pkgname}
    cp -r $srcdir/../${_pkgname}.appdata.xml $pkgdir/usr/share/appdata/${_pkgname}.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256,512x512}/apps
    for length in 16 32 48 64 128 256 512; do
      size="${length}x${length}"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    install -Dm644 packaging/artwork/icon_512x512.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    rm -rf $pkgdir/usr/lib/openra-rv/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,Makefile,.sh,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/openra-rv/{mods/{all,ra,cnc,d2k,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Server,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
