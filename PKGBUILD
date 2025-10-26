# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-wts-git
pkgver=30577.git.7024385
pkgrel=1
pkgdesc="OpenRA built from latest git commit and with the experimental Tiberian Sun mod included."
arch=('x86_64')
url="https://www.openra.net"
license=('GPL3')
install=${pkgname}.install
depends=('dotnet-sdk-8.0.300-bin' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
conflicts=('openra' 'openra-bleed' 'openra-git')
options=(!strip)
source=("git+https://github.com/OpenRA/OpenRA.git")
sha256sums=('SKIP')

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
    make RUNTIME=net8 TARGETPLATFORM=unix-generic
}

package() {
    cd $srcdir/OpenRA
    mkdir -p $pkgdir/usr/lib/openra
    cp -r bin/* $pkgdir/usr/lib/openra
    echo "Source functions.sh..."
    source ./packaging/functions.sh
    echo "Running install_data..."
    install_data . "$pkgdir/usr/lib/openra/" cnc d2k ra ts
    echo "Running install-linux-appdata make command..."
    make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata
    echo "Running install-linux-shortcuts make command..."
    make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts
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
