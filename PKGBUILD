# Maintainer: azerty-xmpp
pkgname=dwl-git-azerty
pkgver=0.8.dev.r87.a2d03cf
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (Custom Azerty/Havoc build)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots-git')
makedepends=('git' 'make' 'wayland-protocols')
source=('git+https://codeberg.org/dwl/dwl')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dwl"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/dwl"
    
    # 1. No Window Border
    sed -i 's/borderpx = .*/borderpx = 0;/g' config.def.h
    
    # 2. Amoled Black Background
    sed -i 's/COLOR(0x.*)/COLOR(0x000000ff);/g' config.def.h
    
    # 3. Havoc for Terminal
    sed -i 's/termcmd\[\] = .*/termcmd[] = { "havoc", NULL };/g' config.def.h
    
    # 4. Meta Key is Modifier
    sed -i 's/WLR_MODIFIER_ALT/WLR_MODIFIER_LOGO/g' config.def.h
}

build() {
    cd "$srcdir/dwl"
    make
}

package() {
    cd "$srcdir/dwl"
    make PREFIX="$pkgdir/usr/" install
    
    # 1. Rename the binary and man page to avoid file collisions
    mv "$pkgdir/usr/bin/dwl" "$pkgdir/usr/bin/dwl-azerty"
    mv "$pkgdir/usr/share/man/man1/dwl.1" "$pkgdir/usr/share/man/man1/dwl-azerty.1"
    
    # 2. Rename the Wayland session file
    mv "$pkgdir/usr/share/wayland-sessions/dwl.desktop" "$pkgdir/usr/share/wayland-sessions/dwl-azerty.desktop"
    
    # 3. Fix the desktop file contents so display managers launch the right binary
    sed -i 's/Name=dwl/Name=dwl (Azerty)/gi' "$pkgdir/usr/share/wayland-sessions/dwl-azerty.desktop"
    sed -i 's/Exec=dwl/Exec=dwl-azerty/g' "$pkgdir/usr/share/wayland-sessions/dwl-azerty.desktop"
}
