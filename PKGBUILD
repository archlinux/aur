# Maintainer: Your Name <your.email@example.com>
pkgname=mediamonkey
pkgver=5.0.5.2695
pkgrel=1
pkgdesc="MediaMonkey is a music manager and media jukebox for serious music collectors and iPod users."
arch=('x86_64')
url="https://www.mediamonkey.com/"
license=('proprietary')
depends=('wine' 'winetricks')
source=("https://www.mediamonkey.com/MediaMonkey-5_Setup.exe")
sha256sums=('SKIP')  # Update with the actual sha256sum of the downloaded installer

prepare() {
    # Create a directory for Wine's prefix
    WINEPREFIX="${srcdir}/wineprefix"
    mkdir -p "$WINEPREFIX"
    export WINEPREFIX

    # Install necessary dependencies in the Wine prefix
    winetricks -q dotnet48
}

package() {
    cd "$srcdir"

    # Set up Wine environment variables
    WINEPREFIX="${srcdir}/wineprefix"
    export WINEPREFIX

    # Install MediaMonkey
    wine "MediaMonkey-5_Setup.exe" /silent /dir="${pkgdir}/opt/mediamonkey"

    # Create a launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mediamonkey" << EOF
#!/bin/bash
WINEPREFIX="\$HOME/.local/share/wineprefixes/mediamonkey"
[ ! -e "\$WINEPREFIX" ] && mkdir -p "\$WINEPREFIX"
wine "/opt/mediamonkey/MediaMonkey.exe" "\$@"
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mediamonkey.desktop" << EOF
[Desktop Entry]
Name=MediaMonkey
Comment=MediaMonkey Music Manager
Exec=mediamonkey
Icon=mediamonkey
Terminal=false
Type=Application
Categories=AudioVideo;Player;Audio;
EOF

    # Install icon (assuming you have an icon file, otherwise skip this part)
    install -Dm644 "${srcdir}/../mediamonkey.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mediamonkey.png"
}

# vim:set ts=2 sw=2 et:
