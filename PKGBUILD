# Maintainer: Mechon AI Team <cemetery394@gmail.com>
pkgname=mechon-ai-git
_pkgname=mechon-ai
pkgver=1.2.2
pkgrel=1
pkgdesc="Local-first desktop workstation for SFT and DPO dataset engineering (always tracks and builds latest release tag)"
arch=('x86_64')
url="https://github.com/Mechon-AI/mechon-ai"
license=('Apache-2.0')
depends=(
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'openssl'
    'pango'
    'sqlite'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'git'
    'nodejs>=18'
    'npm'
    'pkgconf'
    'rust'
)
optdepends=(
    'ollama: local offline inference runtime'
)
provides=('mechon-ai')
conflicts=('mechon-ai')
options=('!lto')
source=(
    "$_pkgname::git+$url.git"
    "mechon-ai.desktop"
)
sha256sums=(
    'SKIP'
    'c958bfc8aa215ff6589ba48f78b5958ae45d19dc6aec3d45c0ebad7b9e2089b5'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git fetch --tags --force --prune origin 2>/dev/null || true

    # Extract the latest semantic release tag from git repository
    local latest_tag
    latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1) 2>/dev/null)
    if [[ -n "$latest_tag" ]]; then
        echo "$latest_tag" | sed 's/^v//'
    else
        git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/$_pkgname"
    # Ensure all remote tags are updated and force-synced
    git fetch --tags --force --prune origin 2>/dev/null || true

    # Resolve and check out the latest release tag
    local latest_tag
    latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1) 2>/dev/null)
    if [[ -n "$latest_tag" ]]; then
        echo "==> [PKGBUILD] Checking out latest release tag: $latest_tag"
        git checkout --force "$latest_tag"
    fi
}

build() {
    # 1. Compile React frontend
    cd "$srcdir/$_pkgname/frontend"
    npm install
    npm run build

    # 2. Compile native Tauri Rust desktop executable
    cd "$srcdir/$_pkgname/src-tauri"
    cargo build --release --locked --bin mechon-ai
}

package() {
    cd "$srcdir/$_pkgname"

    # Install native binary
    install -Dm755 "src-tauri/target/release/mechon-ai" "$pkgdir/usr/bin/mechon-ai"

    # Install desktop entry
    install -Dm644 "$srcdir/mechon-ai.desktop" "$pkgdir/usr/share/applications/mechon-ai.desktop"

    # Install icons into hicolor icon theme
    install -Dm644 "assets/icon-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/mechon-ai.png"
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/mechon-ai.png"
    install -Dm644 "assets/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/mechon-ai.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mechon-ai.png"
    install -Dm644 "assets/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mechon-ai.png"
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mechon-ai.png"
    install -Dm644 "assets/mechon-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mechon-ai.svg"

    # Install documentation & license
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
