# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=animaple-bin
pkgver=2.0.11
pkgrel=1
pkgdesc="Anime streaming app — Flutter cross-platform client (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MapleProjects/AniMaple"
license=('MIT')
provides=('animaple')
conflicts=('animaple' 'animaple-git')
depends=('gtk3' 'mpv' 'xdg-utils' 'hicolor-icon-theme')
options=('!strip' '!debug')
source=(
    "$pkgname-$pkgver-$arch.tar.gz::$url/releases/download/v$pkgver/animaple-v$pkgver-linux-$arch.tar.gz"
)
sha256sums=('2ec13d620fb7572f707038cf3f6e8715fa7ccaeee4cd6669a363688e35462eac')

package() {
    install -dm755 "$pkgdir/usr/lib/animaple"
    cp -r "$srcdir/animaple" "$srcdir/data" "$srcdir/lib" "$pkgdir/usr/lib/animaple/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/animaple" << 'WRAP'
#!/bin/sh
exec /usr/lib/animaple/animaple "$@"
WRAP

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/animaple.desktop" << 'DESKTOP'
[Desktop Entry]
Name=AniMaple
Comment=Anime streaming app
Exec=animaple
Icon=animaple
Terminal=false
Type=Application
Categories=AudioVideo;Video;TV;
StartupWMClass=animaple
DESKTOP

    local icon="$pkgdir/usr/lib/animaple/data/flutter_assets/assets/icon.png"
    if [ -f "$icon" ]; then
        install -Dm644 "$icon" "$pkgdir/usr/share/pixmaps/animaple.png"
        for size in 48 64 128 256 512; do
            install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/animaple.png"
        done
    fi
}
