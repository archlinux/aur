# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus
pkgver=0.46.0
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across your machines'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'kstatusnotifieritem' 'kwindowsystem' 'kidletime'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'libgcc' 'libstdc++' 'glibc' 'hicolor-icon-theme' 'bash' 'tar')
makedepends=('rust' 'cmake' 'ninja' 'qt6-tools' 'qt6-webengine')
optdepends=('konsole: external KDE terminal integration'
            'qt6-webengine: embedded DeepSeek Native UI'
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
sha256sums=('667f8e1b9b1875f94e52a5501dd8ffe732cdebdf2e882d4134b47195cc5bdccf')

prepare() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')" \
        --manifest-path services/mobile/connector/Cargo.toml
}

build() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release
    cargo build --frozen --release --manifest-path services/mobile/connector/Cargo.toml
    cmake -S tray -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr -DHGS_NATIVE_UI_PLUGIN=ON
    cmake --build build
    python scripts/collect-licenses.py "$srcdir/licenses" \
        --manifest-path Cargo.toml --manifest-path services/mobile/connector/Cargo.toml
}

check() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release
    # The journal handoff tests need a Python connector with aiohttp; CI runs them.
    cargo test --frozen --release --manifest-path services/mobile/connector/Cargo.toml \
        --lib --test config_vectors --test journal_vectors --test runtime_vectors --test mutations \
        --test launch_runtime --test binary
}

package() {
    cd "$srcdir/zerus-$pkgver"
    python scripts/package-linux.py --destdir "$pkgdir" \
        --cli target/release/hgs --gui build/hgs-tray --native-ui-plugin build/plugins/libhgs-tray-native-ui.so \
        --connector target/release/zerus-mobile-connector \
        --licenses "$srcdir/licenses" --package-name "$pkgname"
}
