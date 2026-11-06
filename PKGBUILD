# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus
pkgver=0.48.1
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across your machines'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'glib2' 'cairo' 'libsoup3'
         'alsa-lib' 'gstreamer' 'gst-plugins-base-libs'
         'libappindicator' 'dbus'
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'libgcc' 'libstdc++' 'glibc' 'hicolor-icon-theme' 'bash' 'tar')
makedepends=('rust' 'nodejs' 'npm')
optdepends=('konsole: external KDE terminal integration'
            'wl-clipboard: clipboard transfers on Wayland'
            'xclip: clipboard transfers on X11'
            'nodejs: separately installed native agents and DeepSeek Harness'
            'npm: install Codex and DeepSeek Harness from Accounts'
            'git: Git repository and worktree features'
            'systemd: user service autostart and isolated DeepSeek scopes')
provides=('hgs' 'hgs-tray')
conflicts=('zerus-git' 'zerus-ade-bin')
options=('!lto' '!debug')
source=("https://github.com/ufna/zerus/releases/download/v${pkgver}/zerus-${pkgver}-source.tar.gz")
sha256sums=('d24e2e50c8e1c2a9d4519f1775350f925bfc02145a2e60453f40de55644c4aa0')

prepare() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')" \
        --manifest-path services/mobile/connector/Cargo.toml
    cargo fetch --locked --manifest-path client/src-tauri/Cargo.toml \
        --target "$(rustc -vV | sed -n 's/^host: //p')"
    (cd client && npm ci --no-audit --no-fund)
}

build() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="$PWD/target"
    cargo build --frozen --release
    cargo build --frozen --release --manifest-path services/mobile/connector/Cargo.toml
    (cd client && npm exec -- tauri build --no-bundle \
        --config "$PWD/src-tauri/tauri.switch.linux.conf.json" --features video -- --frozen)
    python scripts/collect-licenses.py "$srcdir/licenses" \
        --manifest-path Cargo.toml --manifest-path services/mobile/connector/Cargo.toml \
        --manifest-path client/src-tauri/Cargo.toml --manifest-features client/src-tauri/Cargo.toml=video
}

check() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="$PWD/target"
    cargo test --frozen --release
    cargo test --frozen --release --manifest-path client/src-tauri/Cargo.toml --features video --lib
    # The journal handoff tests need a Python connector with aiohttp; CI runs them.
    cargo test --frozen --release --manifest-path services/mobile/connector/Cargo.toml \
        --lib --test config_vectors --test journal_vectors --test runtime_vectors --test mutations \
        --test launch_runtime --test binary
}

package() {
    cd "$srcdir/zerus-$pkgver"
    python scripts/package-linux.py --destdir "$pkgdir" \
        --cli target/release/hgs --gui target/release/hgs-tray \
        --connector target/release/zerus-mobile-connector \
        --licenses "$srcdir/licenses" --package-name "$pkgname"
}
