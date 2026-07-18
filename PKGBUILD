# Maintainer: azerty-xmpp <your.email@example.com>
pkgname=dwl-git-azerty
pkgver=0.8.dev.r87.a2d03cf
pkgrel=3
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (Custom build)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots-git')
makedepends=('git' 'make' 'wayland-protocols')
source=(
    'git+https://codeberg.org/dwl/dwl'
    'tearing.patch::https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/tearing/tearing.patch'
    'unclutter.patch::https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/unclutter/unclutter.patch'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/dwl"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/dwl"
    
    # 1. Apply the Patches
    patch -p1 < "$srcdir/tearing.patch"
    patch -p1 < "$srcdir/unclutter.patch"
    
    # 2. Force Tearing EVERYWHERE (The Catch-All Rule)
    # Using standard spaces instead of \t to prevent sed literal parsing errors
    sed -i '/static const ForceTearingRule force_tearing\[\] = {/a \    {.title = "", .appid = ""},' config.def.h
    
    # 3. Aesthetics & Term
    sed -i 's/borderpx = .*/borderpx = 0;/g' config.def.h
    # Removed the trailing semicolon in the replacement to prevent ';;' compilation errors
    sed -i 's/COLOR(0x.*)/COLOR(0x000000ff)/g' config.def.h
    sed -i 's/termcmd\[\] = .*/termcmd[] = { "havoc", NULL };/g' config.def.h
    
    # 4. Meta Key
    sed -i 's/WLR_MODIFIER_ALT/WLR_MODIFIER_LOGO/g' config.def.h

    # 5. Mouse Sensitivity (160% of baseline)
    sed -i 's/accel_speed = 0.0;/accel_speed = 0.6;/g' config.def.h
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
