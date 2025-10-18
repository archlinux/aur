# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=grayjay-bin
pkgver=11
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
url="https://grayjay.app/desktop/"
license=('Source First License 1.1')
depends=('gtk3' 'unzip' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator-gtk3')
provides=('grayjay')
conflicts=('grayjay-git')
options=(!strip)
_filename="Grayjay.Desktop-linux-x64-v${pkgver}"
source=("${_filename}.zip::https://updater.grayjay.app/Apps/Grayjay.Desktop/${pkgver}/${_filename}.zip")
sha256sums=('5f35bdd2da2b25b91841f28acc38e23674700dca527e0aa07428fb572cb04648')

prepare() {
    mkdir -p "${srcdir}/grayjay"
    unzip -q "${srcdir}/${_filename}.zip" -d "${srcdir}/grayjay"
}

package() {
    cd "${srcdir}/grayjay/${_filename}"

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

exec sh -c "cd '$APP_DIR' && exec ./Grayjay \"\$@\"" -- "$@"
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
