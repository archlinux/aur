pkgname=openra-ss-git
_pkgname=openra-ss
pkgver=286.git.6e8f8ee
pkgrel=1
pkgdesc="A Sole Survivor-inspired mod of OpenRA, warning you will need the original game assets to play this game"
arch=('any')
url="https://github.com/MustaphaTR/sole-survivor"
license=('GPL3')
install=openra-ss.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip')
provides=('openra-ss')
options=(!strip)
source=("git+https://github.com/MustaphaTR/sole-survivor.git"
"openra-ss"
"openra-ss.appdata.xml"
"openra-ss.desktop")
md5sums=('SKIP'
         '4f41d431c8bb01dbb4569ca698e47402'
         '6f7d848e4a53dd600889572d43ed16d2'
         'b7a61da8bdec86e6756fc7a8cf6f52ae')

pkgver() {
    cd $srcdir/sole-survivor
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/sole-survivor
    dos2unix *.md
    printf "Success in converting docs...\n"
}

build() {
    cd $srcdir/sole-survivor
    make version VERSION="${pkgver}"
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at ${url}/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/sole-survivor
    mkdir -p $pkgdir/usr/{lib/openra-ss/mods,bin,share/pixmaps,share/doc/packages/openra-ss,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-ss
    cp -r engine/{glsl,lua,AUTHORS,COPYING,*.dll*,'global mix database.dat',launch-dedicated.sh,launch-game.sh,*.exe,VERSION} $pkgdir/usr/lib/openra-ss
    cp -r mods/ss $pkgdir/usr/lib/openra-ss/mods
    cp -r engine/mods/{common,modcontent} $pkgdir/usr/lib/openra-ss/mods
    install -Dm775 $srcdir/openra-ss $pkgdir/usr/bin/openra-ss
    cp -r $srcdir/openra-ss.appdata.xml $pkgdir/usr/share/appdata/openra-ss.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-ss/README.md
    cp -r mods/ss/icon.png $pkgdir/usr/share/pixmaps/openra-ss.png
    install -Dm644 $srcdir/openra-ss.desktop $pkgdir/usr/share/applications/openra-ss.desktop
    rm $pkgdir/usr/lib/openra-ss/*.sh
}

