# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=grayjay
pkgver=3
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
provides=('grayjay')
conflicts=('grayjay-bin')
conflicts=('grayjay-git')
url="https://github.com/futo-org/Grayjay.Desktop"
license=('Source First License 1.1')
depends=('dotnet-runtime' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator-gtk3')
makedepends=('dotnet-sdk' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/futo-org/Grayjay.Desktop/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d92e55a3c186b5a7549a956e08952ca6655d4941ffb08ed602b3a939b555cafb')

prepare() {
    cd "$srcdir/grayjay-desktop"
    git config submodule.FUTO.MDNS.url https://github.com/futo-org/FUTO.MDNS.git
    git config submodule.Grayjay.Engine.url https://github.com/futo-org/Grayjay.Engine.git
    git config submodule.JustCef.url https://github.com/futo-org/JustCef.git
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/grayjay-desktop"
    bash ./build.sh
}

package() {
    cd "${srcdir}/grayjay-desktop/Grayjay.Desktop.CEF/bin/Release/net8.0/linux-x64/publish"

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
    cp -a ./* "${pkgdir}/usr/share/grayjay/"
    chmod -R u=rwX,g=rX,o=rX "${pkgdir}/usr/share/grayjay/"

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
    cd "${srcdir}/grayjay-desktop/Grayjay.Desktop.CEF"
    install -Dm644 "grayjay.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/grayjay.png"
}
