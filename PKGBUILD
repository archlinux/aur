# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-wts-git
pkgver=29396.git.211f716
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
"https://raw.githubusercontent.com/wiki/OpenRA/OpenRA/Changelog.md"
"patch-build.patch")
sha256sums=('SKIP'
            'f69d05f297ddb4a2b2fbb59a0632d7ff20efe73843f3e0e49b9e3043a559f443'
            '5614c32c70b8e3c798cfcdcee42a6c707871e6691134d6d7f24bf99247ca0e15')

pkgver() {
    cd $srcdir/OpenRA
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    version="${no}.git.${hash}"
    make version VERSION="${version}"
    printf "$version"
}

prepare() {
	cd $srcdir/OpenRA
	patch -Np1 -i $srcdir/patch-build.patch
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
}
