# Maintainer: Stanley Chan <johnsmith874436@gmail.com>
pkgname=melody-player
pkgver=1.0.1
pkgrel=1
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
    # electron-builder outputs a .pacman file — install it into the package
    install -Dm644 "$srcdir/dist/Melody-$pkgver-x64.pacman" \
        "$pkgdir/melody-player-$pkgver-x64.pacman"

    # Also install the unpacked files directly for a proper system install
    mkdir -p "$pkgdir/opt"
    cp -r "$srcdir/dist/linux-unpacked/"* "$pkgdir/opt/Melody/"

    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec /opt/Melody/Melody "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << DESKTOP
[Desktop Entry]
Name=Melody
Comment=Modern Spotify-inspired music player
Exec=/opt/Melody/Melody %U
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

