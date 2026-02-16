# Maintainer: denuvoless <jason@denuvoless.com>
pkgname=hyprism-git
pkgver=r533.dd1ed9a
pkgrel=1
pkgdesc="A multiplatform Hytale launcher with mod manager and more!"
arch=('x86_64')
url="https://github.com/HyPrismTeam/HyPrism"
license=('GPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('dotnet-sdk>=10' 'npm' 'nodejs' 'git')
provides=('hyprism')
conflicts=('hyprism' 'hyprism-bin')
options=('!strip')
source=("${pkgname}::git+https://github.com/HyPrismTeam/HyPrism.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    # Use "dir" target. Produces an unpacked app directory without
    # needing flatpak/AppImage/deb tooling.
    cat > Properties/electron-builder.json << 'EOF'
{
  "$schema": "https://raw.githubusercontent.com/electron-userland/electron-builder/refs/heads/master/packages/app-builder-lib/scheme.json",
  "compression": "store",
  "artifactName": "${productName}-${os}-${arch}-${version}.${ext}",
  "directories": { "buildResources": "Build", "output": "dist" },
  "linux": {
    "target": ["dir"],
    "executableArgs": ["--no-sandbox"],
    "category": "Game",
    "icon": "icons"
  }
}
EOF

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

    dotnet publish \
        -c Release \
        -p:RuntimeIdentifier=linux-x64 \
        -p:PublishReadyToRun=false
}

package() {
    cd "$pkgname"

    local _unpacked="bin/Release/net10.0/linux-x64/publish/linux-unpacked"

    install -dm755 "$pkgdir/opt/hyprism"
    cp -a "$_unpacked"/. "$pkgdir/opt/hyprism/"
    chmod 755 "$pkgdir/opt/hyprism/HyPrism"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/hyprism" << 'EOF'
#!/bin/sh
exec /opt/hyprism/HyPrism "$@"
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/hyprism.desktop" << EOF
[Desktop Entry]
Name=HyPrism
Comment=A multiplatform Hytale launcher with mod manager and more!
Exec=hyprism
Icon=hyprism
Terminal=false
Type=Application
Categories=Game;
EOF

    if [[ -f Frontend/public/icon.png ]]; then
        install -Dm644 Frontend/public/icon.png "$pkgdir/usr/share/pixmaps/hyprism.png"
    elif [[ -f Frontend/src/assets/images/appicon.png ]]; then
        install -Dm644 Frontend/src/assets/images/appicon.png "$pkgdir/usr/share/pixmaps/hyprism.png"
    fi
}
