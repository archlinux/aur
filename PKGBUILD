# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-wts-git
pkgver=30277.git.1f65fd2
pkgrel=1
pkgdesc="OpenRA built from latest git commit and with the experimental Tiberian Sun mod included."
arch=('x86_64')
url="https://www.openra.net"
license=('GPL3')
install=${pkgname}.install
depends=('dotnet-sdk-8.0' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
conflicts=('openra' 'openra-bleed' 'openra-git')
options=(!strip)
source=("git+https://github.com/OpenRA/OpenRA.git"
	"21683.patch")
sha256sums=('SKIP'
            '540a494b4b2ee182c76589966bcace6193d29d2f9428774ac37619c8095cce7a')

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
	patch -Np1 -i $srcdir/21683.patch
}

build() {
    cd $srcdir/OpenRA
    make all TARGETPLATFORM=unix-generic
}

package() {
    cd $srcdir/OpenRA
    mkdir -p $pkgdir/usr/lib/openra
    echo "Running install make command..."
    make prefix=/usr DESTDIR="$pkgdir" install
    echo "Running install-linux-shortcuts make command..."
    make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts
    echo "Running install-linux-appdata make command..."
    make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata
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
