# Maintainer: Nathan Chere <git@nathanchere.com.au>
pkgname=grayjay-git
pkgver=3.r55.g1dd9774
pkgrel=1
pkgdesc="Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc)"
arch=('x86_64')
provides=('grayjay')
conflicts=('grayjay-bin')
url="https://github.com/futo-org/Grayjay.Desktop"
license=('Source First License 1.1')
depends=('dotnet-runtime' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator-gtk3')
makedepends=('dotnet-sdk' 'git')
options=(!debug)
source=("grayjay-desktop::git+https://github.com/futo-org/Grayjay.Desktop.git"
        "grayjay-engine::git+https://github.com/futo-org/Grayjay.Engine.git"
        "futo-mdns::git+https://github.com/futo-org/FUTO.MDNS.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/grayjay-desktop"
    printf "3.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/grayjay-desktop"
    rm -rf Grayjay.Engine FUTO.MDNS
    cp -r "$srcdir/grayjay-engine" Grayjay.Engine/
    cp -r "$srcdir/futo-mdns" FUTO.MDNS/
}

build() {
    cd "$srcdir/grayjay-desktop"
    dotnet restore Grayjay.ClientServer/Grayjay.ClientServer.csproj
    dotnet build Grayjay.ClientServer/Grayjay.ClientServer.csproj \
        --configuration Release \
        --no-restore \
        --no-self-contained \
        /p:DebugType=None \
        /p:DebugSymbols=false
}

package() {
    cd "$srcdir/grayjay-desktop"

    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"

    cp -r Grayjay.ClientServer/bin/Release/net8.0/* "$pkgdir/usr/lib/$pkgname/"

    cat > "$pkgdir/usr/bin/grayjay" << 'EOF'
#!/bin/sh
APP_DIR="$HOME/.local/share/grayjay"

# Check if app is already installed in user directory
if [ ! -d "$APP_DIR" ]; then
    echo "First run - installing Grayjay to $APP_DIR"
    mkdir -p "$APP_DIR"
    cp -r /usr/lib/grayjay-git/* "$APP_DIR/"
    chmod u+w -R "$APP_DIR"
fi

exec sh -c "cd '$APP_DIR' && exec ./Grayjay \"\$@\"" -- "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/grayjay"

    cat > "$pkgdir/usr/share/applications/grayjay.desktop" << EOF
[Desktop Entry]
Name=Grayjay
Comment=Privacy-respecting client for YouTube, Rumble, Twitch, Spotify etc
Exec=/usr/bin/grayjay
Icon=grayjay
Terminal=false
Type=Application
Categories=Network;Video;AudioVideo;
EOF

    install -Dm644 "Grayjay.Desktop.CEF/grayjay.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/grayjay.png"
}
