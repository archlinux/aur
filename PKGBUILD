# Maintainer: blazebsc <blakeisfruity@proton.me>
# Maintainer: ofatrii <pub@oftr.me>
pkgname=froststrap-git
pkgver=2.0.6.beta.6.r2.gf4079a5c
pkgrel=1
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT' 'MPL-2.0')
depends=('icu' 'dbus' 'fontconfig' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0' 'git' 'rust' 'clang' 'zlib')
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
    # Upstream's official build path since 2.0.6 (NativeAOT).
    # RUSTFLAGS="" is required: the repo's .cargo/config.toml sets
    # "-Z threads=8", which only the nightly compiler accepts.
    export RUSTFLAGS=""
    cd Froststrap
    cargo xtask publish --no-installers --configuration release
}

package() {
    cd Froststrap

    # Install the AOT single binary
    install -Dm755 .build/publish/Froststrap "$pkgdir/usr/lib/froststrap/Froststrap"

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
