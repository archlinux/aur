# Maintainer: blazebsc <blakeisfruity at proton dot me>
# Maintainer: ofatrii <pub@oftr.me>
pkgname=froststrap
_tag='v2.0.8'
pkgver=${_tag#v}
pkgver=${pkgver//-/.}
pkgrel=1
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT' 'MPL-2.0')
depends=('icu' 'dbus' 'fontconfig' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0' 'git' 'rust' 'clang' 'zlib')
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

prepare() {
    cd Froststrap
    git submodule update --init --recursive
}

build() {
    # Upstream's official build path (NativeAOT).
    # RUSTFLAGS="" is required: the repo's .cargo/config.toml sets
    # "-Z threads=8", which only the nightly compiler accepts.
    export RUSTFLAGS=""
    cd Froststrap
    cargo xtask publish --no-installers --configuration release
}

package() {
    cd Froststrap

    # Install the AOT binary and native libraries (layout mirrors
    # upstream's own packages; the app resolves /usr/lib/froststrap
    # itself, see Froststrap/AppInitializer.cs)
    install -Dm755 .build/publish/froststrap "$pkgdir/usr/bin/froststrap"
    install -Dm755 .build/publish/libs/*.so -t "$pkgdir/usr/lib/froststrap/"

    # Install icon
    install -Dm644 build/icon512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/froststrap.png"

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
