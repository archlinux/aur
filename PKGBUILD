# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-vs-git
_pkgname=openra-vs
pkgver=2101.git.b74129b
pkgrel=1
pkgdesc="A Command & Conquer: Red Alert 2-inspired mod of OpenRA"
arch=('any')
url="https://github.com/AttacqueSuperior/ValiantShades"
license=('GPL3')
install=openra-vs.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-vs')
options=(!strip)
source=("git+${url}.git"
"openra-vs"
"openra-vs.appdata.xml"
"openra-vs.desktop")
md5sums=('SKIP'
         '2f433e978c719c73a08147fd49c7c3c1'
         'd0c770a035d7bbda24171dcd58b54b47'
         '476642809c2b0e5af5a926218c7d2821')

pkgver() {
    cd $srcdir/ValiantShades
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/ValiantShades
    dos2unix *.md
    printf "Success in converting docs...\n"
}

build() {
    cd $srcdir/ValiantShades
    make version VERSION="${pkgver}"
    printf "Success in setting version\n"
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at https://github.com/AttacqueSuperior/ValiantShades/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/ValiantShades
    mkdir -p $pkgdir/usr/{lib/openra-vs/mods,bin,share/pixmaps,share/doc/packages/openra-vs,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-vs
    cp -r engine/* $pkgdir/usr/lib/openra-vs
    cp -r mods/ra2vsh $pkgdir/usr/lib/openra-vs/mods
    cp -r engine/mods/{as,common,modcontent} $pkgdir/usr/lib/openra-vs/mods
    install -Dm755 $srcdir/openra-vs $pkgdir/usr/bin/openra-vs
    cp -r $srcdir/openra-vs.appdata.xml $pkgdir/usr/share/appdata/openra-vs.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-vs/README.md
    cp -r mods/ra2vsh/icon.png $pkgdir/usr/share/pixmaps/openra-vs.png
    install -Dm644 $srcdir/openra-vs.desktop $pkgdir/usr/share/applications/openra-vs.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm -rf $pkgdir/usr/lib/openra-vs/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,.sh,Makefile,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/openra-vs/{mods/{all,cnc,d2k,ra,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Server,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
