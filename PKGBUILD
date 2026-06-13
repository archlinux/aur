# Maintainer: azerty-xmpp <your.email@example.com>
pkgname=dwl-git-azerty
pkgver=0.8.dev.r87.a2d03cf
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (Custom Azerty/Havoc/Tearing build)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots-git')
makedepends=('git' 'make' 'wayland-protocols')
source=(
    'git+https://codeberg.org/dwl/dwl'
    'tearing.patch::https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/tearing/tearing.patch'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/dwl"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/dwl"
    
    # 1. Apply the Tearing Patch
    patch -p1 < "$srcdir/tearing.patch"
    
    # 2. Force Tearing EVERYWHERE (The Catch-All Rule)
    # Using NULL for both values tells dwl to apply this to all clients.
    sed -i '/static const ForceTearingRule force_tearing\[\] = {/a \t{.title = NULL, .appid = NULL},' config.def.h
    
    # 3. Aesthetics & Term
    sed -i 's/borderpx = .*/borderpx = 0;/g' config.def.h
    sed -i 's/COLOR(0x.*)/COLOR(0x000000ff);/g' config.def.h
    sed -i 's/termcmd\[\] = .*/termcmd[] = { "havoc", NULL };/g' config.def.h
    
    # 4. Meta Key
    sed -i 's/WLR_MODIFIER_ALT/WLR_MODIFIER_LOGO/g' config.def.h
}

build() {
    cd "$srcdir/dwl"
    make
}

package() {
    cd "$srcdir/dwl"
    make PREFIX="$pkgdir/usr/" install
    
    mv "$pkgdir/usr/bin/dwl" "$pkgdir/usr/bin/dwl-azerty"
    mv "$pkgdir/usr/share/man/man1/dwl.1" "$pkgdir/usr/share/man/man1/dwl-azerty.1"
    mv "$pkgdir/usr/share/wayland-sessions/dwl.desktop" "$pkgdir/usr/share/wayland-sessions/dwl-azerty.desktop"
    
    sed -i 's/Name=dwl/Name=dwl (Azerty)/gi' "$pkgdir/usr/share/wayland-sessions/dwl-azerty.desktop"
    
    # Inject the WLR_DRM_NO_ATOMIC=1 environment variable directly into the display manager launch command
    sed -i 's/Exec=dwl/Exec=env WLR_DRM_NO_ATOMIC=1 dwl-azerty/g' "$pkgdir/usr/share/wayland-sessions/dwl-azerty.desktop"
}
