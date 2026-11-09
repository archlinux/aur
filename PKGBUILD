# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=tidra
pkgver=1.0.6
pkgrel=1
pkgdesc="Keep every project you maintain up to date from one desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/yusifaliyevpro/tidra-app"
license=('AGPL-3.0-or-later')
depends=(
    cairo
    dbus
    gdk-pixbuf2
    git
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libappindicator
    libgcc
    libsoup3
    libx11
    libxi
    sh
    util-linux
    'webkit2gtk-4.1'
)
makedepends=(cargo nodejs pnpm)
optdepends=(
    'org.freedesktop.secrets: store tokens in the desktop keyring'
    'nodejs: manage Node.js projects'
    'npm: manage npm projects'
    'pnpm: manage pnpm projects'
    'yarn: manage Yarn projects'
    'bun: manage Bun projects'
    'github-cli: import an existing GitHub CLI authentication token'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ebfaddfbf70c622b39b06f64673401e5b719602806239727df1b1bd8d4d459e0')
# Use upstream's Rust LTO settings instead of makepkg's compiler flags.
options=('!lto')

prepare() {
    cd "$pkgname-app-$pkgver"

    # Updates are managed by pacman rather than upstream's installer.
    node --input-type=module <<'EOF'
import fs from 'node:fs';
const file = 'src-tauri/tauri.conf.json';
const config = JSON.parse(fs.readFileSync(file, 'utf8'));
config.bundle.createUpdaterArtifacts = false;
config.plugins.updater.endpoints = [];
fs.writeFileSync(file, JSON.stringify(config, null, 2) + '\n');
EOF

    pnpm install --frozen-lockfile
    cargo fetch --locked --manifest-path src-tauri/Cargo.toml \
        --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-app-$pkgver"

    export CARGO_TARGET_DIR="$srcdir/target"
    export CARGO_PROFILE_RELEASE_STRIP=false

    # Invoke Tauri directly: upstream's build script requires a signing .env.local.
    pnpm exec tauri build --no-bundle -- --frozen
}

package() {
    cd "$pkgname-app-$pkgver"

    install -Dm755 "$srcdir/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

    local size
    for size in 32 64 128; do
        install -Dm644 "src-tauri/icons/${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    done
    install -Dm644 src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Tidra
Comment=Keep every project you maintain up to date
Exec=tidra
Icon=tidra
Terminal=false
Categories=Development;
StartupWMClass=tidra
EOF
}
