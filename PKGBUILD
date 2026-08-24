# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgname="wallpiper-git"
pkgver=r0.0000000
pkgrel=1
pkgdesc="Native translation layer for Wallpaper Engine on Linux"
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
depends=('dbus')
optdepends=('fontconfig: local font overrides for Wallpaper Engine content'
            'proton: required to run wallpaper64.exe under Wallpaper Engine'
            'wallpiper-gnome-git: GNOME (Mutter) portal'
            'wallpiper-kde-git: KDE Plasma portal'
            'wallpiper-hyprland-git: Hyprland portal'
            'wallpiper-sway-git: Sway portal'
            'wallpiper-cosmic-git: COSMIC portal'
            'wallpiper-i3-git: i3wm portal')
provides=('wallpiper')
conflicts=('wallpiper')
makedepends=('git' 'dbus' 'vulkan-headers')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make build-core
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/wallpiperd "$pkgdir/usr/lib/wallpiper/wallpiperd"
    install -Dm755 target/release/wallpiperctl "$pkgdir/usr/lib/wallpiper/wallpiperctl"
    install -Dm755 target/release/libwallpiper-preload.so "$pkgdir/usr/lib/wallpiper/libwallpiper-preload.so"
    install -Dm755 target/release/libVkLayer_wallpiper_capture.so "$pkgdir/usr/lib/wallpiper/libVkLayer_wallpiper_capture.so"
    install -Dm644 target/release/dwmapi.dll "$pkgdir/usr/lib/wallpiper/dwmapi.dll"

    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/wallpiper/wallpiperd "$pkgdir/usr/bin/wallpiperd"
    ln -s /usr/lib/wallpiper/wallpiperctl "$pkgdir/usr/bin/wallpiperctl"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
