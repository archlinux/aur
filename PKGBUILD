# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-rv-git
_pkgname=openra-rv
pkgver=2393.git.cb4da92
pkgrel=1
pkgdesc="A Command & Conquer: Red Alert 2-inspired mod of OpenRA"
arch=('any')
url="https://github.com/MustaphaTR/Romanovs-Vengeance"
license=('GPL3')
install=openra-rv.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-rv')
options=(!strip)
source=("git+${url}.git"
"openra-rv"
"openra-rv.appdata.xml"
"openra-rv.desktop")
md5sums=('SKIP'
         '80198a3797c5f4103536702d15e37f19'
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
    make version VERSION="${pkgver}"
    printf "Success in setting version\n"
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at https://github.com/MustaphaTR/Romanovs-Vengeance/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/Romanovs-Vengeance
    mkdir -p $pkgdir/usr/{lib/openra-rv/mods,bin,share/pixmaps,share/doc/packages/openra-rv,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-rv
    cp -r engine/* $pkgdir/usr/lib/openra-rv
    cp -r mods/rv $pkgdir/usr/lib/openra-rv/mods
    cp -r engine/mods/{as,common,modcontent} $pkgdir/usr/lib/openra-rv/mods
    install -Dm755 $srcdir/openra-rv $pkgdir/usr/bin/openra-rv
    cp -r $srcdir/openra-rv.appdata.xml $pkgdir/usr/share/appdata/openra-rv.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-rv/README.md
    install -Dm644 $srcdir/openra-rv.desktop $pkgdir/usr/share/applications/openra-rv.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256,512x512}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/artwork/icon_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    install -Dm644 packaging/artwork/icon_512x512.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    rm -rf $pkgdir/usr/lib/openra-rv/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,.sh,Makefile,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/openra-rv/{mods/{all,cnc,d2k,ra,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Server,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
