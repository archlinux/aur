# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-sa-git
_pkgname=${pkgname/-git}
pkgver=1083.git.63830ec
pkgrel=1
pkgdesc="A mod of OpenRA that reimagines the 1999 Swarm Assault game"
arch=(x86_64)
url="https://github.com/Dzierzan/OpenSA"
license=('GPL3')
install=openra-sa.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'gtk-update-icon-cache' 
         'libaccounts-glib' 'libibus' 'libblockdev' 'libgexiv2'
         'desktop-file-utils' 'xdg-utils' 'zenity' 'python-gobject')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-sa')
options=(!strip)
source=("git+${url}.git"
"openra-sa"
"openra-sa.appdata.xml"
"openra-sa.desktop")
md5sums=('SKIP'
         'f13888474aeeb31acbe019d10d3d644c'
         '842adc4e572c5902400de97eb8a61b8c'
         'a7eee25f52a1f9ab362fee6e6e669842')

pkgver() {
    cd $srcdir/OpenSA
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/OpenSA
    dos2unix *.md
    printf "Success in converting docs...\n"
}

build() {
    cd $srcdir/OpenSA
    make
    make version VERSION="${pkgver}"
    printf "Success in setting version\n" 
}

package() {
    cd $srcdir/OpenSA
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/${_pkgname},share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/${_pkgname}
    cp -r engine/* $pkgdir/usr/lib/${_pkgname}
    cp -r mods/{sa,sacontent} $pkgdir/usr/lib/${_pkgname}/mods
    cp -r mod.config $pkgdir/usr/lib/${_pkgname}
    sed -i -e "s|./engine\"|/usr/lib/${_pkgname}\"|g" $pkgdir/usr/lib/${_pkgname}/mod.config
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/bin/{*.dll*,*.so} $pkgdir/usr/lib/${_pkgname}
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
    rm -rf $pkgdir/usr/lib/${_pkgname}/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,Makefile,.sh,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/${_pkgname}/{mods/{all,ra,cnc,d2k,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Server,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
