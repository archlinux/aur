# Maintainer: blazebsc <blakeisfruity@proton.me>
pkgname=froststrap
_tag='v2.0.0-beta.9'
pkgver=2.0.0.beta.9
pkgrel=2
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT')
depends=('dotnet-runtime-10.0' 'icu' 'fontconfig' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0' 'git')
source=("git+${url}.git#tag=${_tag}"
    "git+https://github.com/Froststrap/ColorPicker-Avalonia.git")
sha256sums=('3f2aa61592fb49b6a2809b4320f06b7b2798fd23840ff9bc8e9a0ddebc52e8e5'
            'SKIP')

prepare() {
    cd Froststrap
    git submodule update --init --recursive
}

build() {
    cd Froststrap
    dotnet publish "$srcdir/Froststrap/Froststrap/Froststrap.csproj" \
        -r linux-x64 \
        -c Release \
        --self-contained false \
        -p:PublishSingleFile=false \
        -p:PublishReadyToRun=false \
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/AGPL-3.0"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/MIT" 2>/dev/null || true
}
