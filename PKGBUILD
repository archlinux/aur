# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=grayjay-bin
pkgver=0.r20241225
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platform (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
url="https://grayjay.app/desktop/"
license=('Source First License 1.1')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator-gtk3')
provides=('grayjay')
conflicts=('grayjay')
options=(!strip)
_filename="Grayjay.Desktop-linux-x64.zip"
source=("${_filename}::https://updater.grayjay.app/Apps/Grayjay.Desktop/${_filename}")
sha256sums=('314e002552a413cd3f13d8a4abd44a20bf59de7a70982d8dd0f1f26ddfbe8d03')

prepare() {
    mkdir -p "${srcdir}/grayjay"
    unzip -q "${srcdir}/${_filename}" -d "${srcdir}/grayjay"
}

package() {
    cd "${srcdir}/grayjay/Grayjay.Desktop-linux-x64-v2"

    # Create necessary directories
    install -dm755 "${pkgdir}/usr/share/grayjay"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    # Create launcher script that copies app to user directory on first run
    cat > "${pkgdir}/usr/bin/grayjay" << 'EOF'
#!/bin/sh
APP_DIR="$HOME/.local/share/grayjay"

# Check if app is already installed in user directory
if [ ! -d "$APP_DIR" ]; then
    echo "First run - installing Grayjay to $APP_DIR"
    mkdir -p "$APP_DIR"
    cp -r /usr/share/grayjay/* "$APP_DIR/"
    chmod u+w -R "$APP_DIR"
fi

exec "$APP_DIR/Grayjay" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/grayjay"

    # Copy application files to system directory (will be copied to user dir on first run)
    cp -r ./* "${pkgdir}/usr/share/grayjay/"

    # Create desktop entry
    cat > "${pkgdir}/usr/share/applications/grayjay.desktop" << EOF
[Desktop Entry]
Name=Grayjay
Comment=Privacy-respecting client for YouTube, Rumble, Twitch, Spotify etc
Exec=/usr/bin/grayjay
Icon=grayjay
Terminal=false
Type=Application
Categories=Network;Video;AudioVideo;
EOF

    # Install icon
    install -Dm644 "grayjay.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/grayjay.png"
}
