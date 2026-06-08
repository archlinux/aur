# Maintainer: ABOhiccups <info@abohiccups.com>
pkgname=project-plus-netplay
pkgver='v3.1.5.2601'
pkgrel='1'
pkgdesc="A Mod of Super Smash Bros. Brawl with Netplay."
arch=('x86_64')
url="https://projectplusgame.com/"
license=('GPL')
depends=('alsa-lib' 'bluez-libs' 'cairo' 'curl' 'enet' 'ffmpeg' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hidapi' 'libevdev' 'libpng' 'libpulse' 'libsm' 'libusb' 'libx11' 'libxi' 'libxrandr' 'libxxf86vm' 'lzo' 'mbedtls' 'miniupnpc' 'official-gamecube-controller-adapter-rules' 'pango' 'sfml' 'systemd-libs' 'zlib')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!strip')
_url="https://github.com/Project-Plus-Development-Team/Project-Plus-Dolphin/releases"
_tag='v3.1.5-2601'
_package="Project+.$_tag.Netplay.Linux.AppImage.zip"
source=(
	"$_package::$_url/download/$_tag/Project+.$_tag.Netplay.Linux.AppImage.zip"
)
sha256sums=('345a9236cd1397e65d3d119dd11acb7423f8a335f21f47503d991a8cb3050f00')

prepare() {
    cd "$srcdir"

    appimage=$(find . -type f -name "*.AppImage" -print -quit)

    chmod +x "$appimage"
    "$appimage" --appimage-extract
}

package() {
    cd "$srcdir"

    appimage=$(find . -type f -name "*.AppImage" -print -quit)

    install -Dm755 "$appimage" "$pkgdir/usr/bin/$pkgname"

    # Install config directory if it exists
    if [[ -d "$appimage.config" ]]; then
        cp -a "$appimage.config" "$pkgdir/usr/bin/$pkgname.config"
        chmod -R u+rwX,go+rwX "$pkgdir/usr/bin/$pkgname.config"
    else
        install -dm777 "$pkgdir/usr/bin/$pkgname.config"
    fi

    # Install home directory if it exists
    if [[ -d "$appimage.home" ]]; then
        cp -a "$appimage.home" "$pkgdir/usr/bin/$pkgname.home"
        chmod -R u+rwX,go+rwX "$pkgdir/usr/bin/$pkgname.home"
    else
        install -dm777 "$pkgdir/usr/bin/$pkgname.home"
    fi

    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/project-plus-dolphin.png \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=${pkgver:1}
Name=Project+ Netplay
Comment=A Mod of Super Smash Bros. Brawl with Netplay.
Path=/usr/bin
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Game
Keywords=project+;brawl;netplay
EOF
}
