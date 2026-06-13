# Maintainer: Stanley Chan <johnsmith874436@gmail.com>
pkgname=melody-player
pkgver=1.0.1
pkgrel=3
pkgdesc="Modern Spotify-inspired desktop music player"
arch=('x86_64')
url="https://github.com/johnsmith8736/melody-player"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss' 'libnotify' 'libxtst' 'xdg-utils')
makedepends=('npm' 'nodejs')
conflicts=('melody-player-git')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir"
    npm install --omit=optional
    npm run dist
}

package() {
    # electron-builder pacman target already produced a valid .pkg.tar.zst —
    # install it into $pkgdir so makepkg can pick it up, then extract it.
    install -Dm644 "$srcdir/dist/Melody-$pkgver-x64.pacman" \
        "$pkgdir/melody-player-$pkgver-x64.pacman"

    # Install unpacked files into /opt/Melody
    mkdir -p "$pkgdir/opt/Melody"
    cp -r "$srcdir/dist/linux-unpacked/"* "$pkgdir/opt/Melody/"

    # Launcher script
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec /opt/Melody/melody-player "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << DESKTOP
[Desktop Entry]
Name=Melody
Comment=Modern Spotify-inspired music player
Exec=/opt/Melody/melody-player %U
Icon=$pkgname
Terminal=false
Type=Application
Categories=Audio;Music;Player;
MimeType=audio/mpeg;audio/x-wav;audio/ogg;audio/flac;audio/x-vorbis+ogg;audio/x-flac;
StartupWMClass=Melody
DESKTOP

    # Icon
    mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    cp "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}

