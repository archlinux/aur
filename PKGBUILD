# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=openra-radot5-git
_pkgname=openra-radot5
pkgver=178.git.fac9662
pkgrel=1
pkgdesc="OpenRA mod that tell the storyline between 1936 to Red Alert 1"
arch=('any')
url="https://github.com/MustaphaTR/Red-Alert-.5"
license=('GPL3')
install=openra-radot5.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-radot5')
options=(!strip)
source=("git+${url}.git"
"openra-radot5"
"openra-radot5.appdata.xml"
"openra-radot5.desktop")
md5sums=('SKIP'
         '19f94aacaab367f2dada6c5d89987a8f'
         'c53603fdbe9b438722658226bcc36aee'
         'aa5929872e801213be21a5d4f0b58f3b')

pkgver() {
    cd $srcdir/Red-Alert-.5
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/Red-Alert-.5
    dos2unix *.md
    printf "Success in converting docs...\n"
}

build() {
    cd $srcdir/Red-Alert-.5
    make version VERSION="${pkgver}"
    printf "Success in setting version\n"
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at https://github.com/MustaphaTR/Red-Alert-.5/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/Red-Alert-.5
    mkdir -p $pkgdir/usr/{lib/openra-radot5/mods,bin,share/pixmaps,share/doc/packages/openra-radot5,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-radot5
    cp -r engine/* $pkgdir/usr/lib/openra-radot5
    cp -r mods/radot5 $pkgdir/usr/lib/openra-radot5/mods
    cp -r engine/mods/{as,common,modcontent} $pkgdir/usr/lib/openra-radot5/mods
    install -Dm755 $srcdir/openra-radot5 $pkgdir/usr/bin/openra-radot5
    cp -r $srcdir/openra-radot5.appdata.xml $pkgdir/usr/share/appdata/openra-radot5.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-radot5/README.md
    cp -r mods/radot5/icon.png $pkgdir/usr/share/pixmaps/openra-radot5.png
    install -Dm644 $srcdir/openra-radot5.desktop $pkgdir/usr/share/applications/openra-radot5.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256,512x512}/apps
    for size in 16 32 48 64 128 256 512; do
      size="${size}x${size}"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm -rf $pkgdir/usr/lib/openra-radot5/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,.sh,Makefile,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/openra-radot5/{mods/{all,cnc,d2k,ra,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Server,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
