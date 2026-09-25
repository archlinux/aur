# Maintainer: blazebsc <blakeisfruity at proton dot me>
# Maintainer: ofatrii <pub@oftr.me>
pkgname=froststrap
_tag='v2.0.2'
pkgver=${_tag#v}
pkgver=${pkgver//-/.}
pkgrel=3
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT' 'MPL-2.0')
depends=('dotnet-runtime-10.0' 'icu' 'fontconfig' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0' 'git' 'rust')
source=("git+${url}.git#tag=${_tag}"
    "git+https://github.com/Froststrap/ColorPicker.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd Froststrap
    git submodule update --init --recursive
}

build() {
    # TODO 2.0.3: switch to upstream's Fallout build system once it
    # supports --no-installers:
    #   dotnet run --project build -- publish --no-installers --configuration Release
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
    install -Dm644 LICENSES/AGPL-3.0-only "$pkgdir/usr/share/licenses/$pkgname/AGPL-3.0"
    install -Dm644 LICENSES/MIT "$pkgdir/usr/share/licenses/$pkgname/MIT"
    install -Dm644 LICENSES/MPL-2.0 "$pkgdir/usr/share/licenses/$pkgname/MPL-2.0"
}
