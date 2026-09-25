# Maintainer: blazebsc <blakeisfruity@proton.me>
pkgname=froststrap-git
pkgver=2.0.3.r5.g3319c2c5
pkgrel=1
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT' 'MPL-2.0')
depends=('dotnet-runtime-10.0' 'icu' 'fontconfig' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0' 'git' 'rust')
provides=('froststrap')
conflicts=('froststrap')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd Froststrap
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd Froststrap
    git submodule update --init --recursive
}

build() {
    cd Froststrap
    _appver=$(git describe --tags | sed 's/^v//')
    dotnet publish "$srcdir/Froststrap/Froststrap/Froststrap.csproj" \
        -r linux-x64 \
        -c Release \
        --self-contained false \
        -p:PublishSingleFile=false \
        -p:PublishReadyToRun=false \
        -p:AppVersion="$_appver" \
        --output build/aur-release
}

package() {
    cd Froststrap

    # Install binary and libraries
    mkdir -p "$pkgdir/usr/lib/froststrap/"
    cp -r build/aur-release/* "$pkgdir/usr/lib/froststrap/"

    # Create wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/froststrap" <<'EOF'
#!/bin/sh
exec /usr/lib/froststrap/Froststrap "$@"
EOF

    # Install icon
    install -Dm644 Froststrap/Froststrap.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/froststrap.png"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/froststrap.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Froststrap
Comment=A fork of Fishstrap, focused on performance and customization
Exec=froststrap %u
TryExec=froststrap
Icon=froststrap
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/roblox;x-scheme-handler/roblox-player;
EOF

    # Install licenses
    install -Dm644 LICENSES/AGPL-3.0-only "$pkgdir/usr/share/licenses/$pkgname/AGPL-3.0"
    install -Dm644 LICENSES/MIT "$pkgdir/usr/share/licenses/$pkgname/MIT"
    install -Dm644 LICENSES/MPL-2.0 "$pkgdir/usr/share/licenses/$pkgname/MPL-2.0"
}
