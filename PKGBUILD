# Maintainer: Ethan Alexander <ethanjalexander@hotmail.ca>

pkgbase="wallpiper-git"
pkgname=("wallpiper-git" "wallpiper-gnome-git" "wallpiper-kde-git")
pkgver=r0.0000000
pkgrel=1
arch=('x86_64')
url="https://github.com/shdwmtr/wallpiper"
license=('MIT')
makedepends=('git' 'dbus' 'vulkan-headers' 'wayland' 'wayland-protocols' 'libxcb'
             'cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative'
             'mesa' 'libx11' 'libxrandr' 'libdrm' 'mutter' 'gobject-introspection')
source=("$pkgbase::git+$url.git")
sha256sums=('SKIP')

_pkgdir="$pkgbase"

pkgver() {
    cd "$srcdir/$_pkgdir"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgdir"

    make build-protocol build-daemon build-ctl build-vklayer build-interpose \
        build-dwmapi-shim build-wl-common build-hyprland build-i3 build-sway \
        build-cosmic build-gnome

    cmake -S portals/wallpiper-portal-kde/native -B target/kde \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build target/kde --parallel
}

package_wallpiper-git() {
    pkgdesc="Native translation layer for Wallpaper Engine on Linux"
    depends=('dbus' 'wayland' 'libxcb')
    optdepends=('fontconfig: local font overrides for Wallpaper Engine content'
                'proton: required to run wallpaper64.exe under Wallpaper Engine'
                'wallpiper-gnome-git: GNOME (Mutter) portal'
                'wallpiper-kde-git: KDE Plasma portal')
    provides=('wallpiper')
    conflicts=('wallpiper')

    cd "$srcdir/$_pkgdir"

    install -Dm755 target/release/wallpiperd "$pkgdir/usr/lib/wallpiper/wallpiperd"
    install -Dm755 target/release/wallpiperctl "$pkgdir/usr/lib/wallpiper/wallpiperctl"
    install -Dm755 target/release/libwallpiper-preload.so "$pkgdir/usr/lib/wallpiper/libwallpiper-preload.so"
    install -Dm755 target/release/libVkLayer_wallpiper_capture.so "$pkgdir/usr/lib/wallpiper/libVkLayer_wallpiper_capture.so"
    install -Dm644 target/release/dwmapi.dll "$pkgdir/usr/lib/wallpiper/dwmapi.dll"

    for portal in hyprland i3 sway cosmic; do
        install -Dm755 "target/release/wallpiper-portal-$portal" "$pkgdir/usr/lib/wallpiper/wallpiper-portal-$portal"
    done

    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/wallpiper/wallpiperd "$pkgdir/usr/bin/wallpiperd"
    ln -s /usr/lib/wallpiper/wallpiperctl "$pkgdir/usr/bin/wallpiperctl"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_wallpiper-gnome-git() {
    pkgdesc="GNOME (Mutter) portal for wallpiper"
    depends=('wallpiper-git' 'mutter' 'gobject-introspection' 'gnome-shell' 'mesa' 'libdrm' 'libxrandr' 'libx11')
    provides=('wallpiper-gnome')
    conflicts=('wallpiper-gnome')
    install="wallpiper-gnome-git.install"

    cd "$srcdir/$_pkgdir"

    make -C portals/wallpiper-portal-gnome/native install DESTDIR="$pkgdir" PREFIX=/usr

    local extdir="$pkgdir/usr/share/gnome-shell/extensions/wallpiper-gnome@wallpiper.dev"
    install -d "$extdir"
    cp -r portals/wallpiper-portal-gnome/extension/. "$extdir/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_wallpiper-kde-git() {
    pkgdesc="KDE Plasma 6 portal for wallpiper"
    depends=('wallpiper-git' 'qt6-base' 'qt6-declarative' 'mesa' 'libx11' 'libxrandr')
    provides=('wallpiper-kde')
    conflicts=('wallpiper-kde')
    install="wallpiper-kde-git.install"

    cd "$srcdir/$_pkgdir"

    DESTDIR="$pkgdir" cmake --install target/kde

    local plasmadir="$pkgdir/usr/share/plasma/wallpapers/dev.wallpiper.kde"
    install -d "$plasmadir"
    cp -r portals/wallpiper-portal-kde/extension/. "$plasmadir/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
