pkgname=openra-ss-git
_pkgname=openra-ss
pkgver=381.git.06a2294
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
         'c6a01630a11e9d51a7a24ffcc7bf14e6'
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
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at ${url}/issues/new, after checking\n" && \
	printf "for existing issues.\n")
    make version VERSION="${pkgver}"
}

package() {
    cd $srcdir/sole-survivor
    mkdir -p $pkgdir/usr/{lib/${_pkgname}/mods,bin,share/pixmaps,share/doc/packages/${_pkgname},share/applications,share/appdata}
    cp -r mod.config $pkgdir/usr/lib/${_pkgname}
    sed -i -e "s|./engine\"|/usr/lib/${_pkgname}\"|g" mod.config
    cp -r engine/{glsl,lua,AUTHORS,COPYING,'global mix database.dat',launch-dedicated.sh,launch-game.sh,VERSION} $pkgdir/usr/lib/${_pkgname}
    cp -r engine/bin $pkgdir/usr/lib/${_pkgname}
    cp -r mods/ss $pkgdir/usr/lib/${_pkgname}/mods
    cp -r engine/mods/{cnc,common,modcontent} $pkgdir/usr/lib/${_pkgname}/mods
    install -Dm775 $srcdir/${_pkgname} $pkgdir/usr/bin/${_pkgname}
    cp -r $srcdir/../${_pkgname}.appdata.xml $pkgdir/usr/share/appdata/${_pkgname}.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/${_pkgname}/README.md
    cp -r mods/ss/icon.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
    install -Dm644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    rm $pkgdir/usr/lib/${_pkgname}/*.sh
}

