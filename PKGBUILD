# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-wts-git
pkgver=29586.git.bf64339
pkgrel=1
pkgdesc="OpenRA built from latest git commit and with the experimental Tiberian Sun mod included."
arch=('x86_64')
url="https://www.openra.net"
license=('GPL3')
install=${pkgname}.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip' 'mono-msbuild')
conflicts=('openra' 'openra-bleed' 'openra-git')
options=(!strip)
source=("git+https://github.com/OpenRA/OpenRA.git"
"https://raw.githubusercontent.com/wiki/OpenRA/OpenRA/Changelog.md")
sha256sums=('SKIP'
            '47eba0cbd69f2fccc68295b8d5b05e316b5ba92092c9e097b66fe7d75ccf0129')

pkgver() {
    cd $srcdir/OpenRA
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    version="${no}.git.${hash}"
    make version VERSION="${version}"
    printf "$version"
}

build() {
    cd $srcdir/OpenRA
    make all RUNTIME=mono DEBUG=false TARGETPLATFORM=unix-generic
}

package() {
    cd $srcdir/OpenRA
    mkdir -p $pkgdir/usr/lib/openra
    make prefix=/usr DESTDIR="$pkgdir" install DEBUG=false RUNTIME=mono
    make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts DEBUG=false   
    make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata DEBUG=false
    cp -r mods/ts $pkgdir/usr/lib/openra/mods
    cp $pkgdir/usr/bin/openra-ra $pkgdir/usr/bin/openra-ts
    cp $pkgdir/usr/share/applications/openra-ra.desktop $pkgdir/usr/share/applications/openra-ts.desktop
    sed -i -e "s|-ra|-ts|g" \
       -e "s|=ra|=ts|g" \
       -e "s|Red Alert|Tiberian Sun|g" $pkgdir/usr/bin/openra-ts
    sed -i -e "s|-ra|-ts|g" \
       -e "s|Red Alert|Tiberian Sun|g" $pkgdir/usr/share/applications/openra-ts.desktop
    mkdir -p $pkgdir/usr/lib/openra/src
}
