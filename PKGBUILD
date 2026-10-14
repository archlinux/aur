# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus
pkgver=0.42.2
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across your machines'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'kstatusnotifieritem' 'kwindowsystem' 'kidletime'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'libgcc' 'libstdc++' 'glibc' 'hicolor-icon-theme' 'bash' 'tar')
makedepends=('rust' 'cmake' 'ninja' 'qt6-webengine')
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
sha256sums=('c83b01eaa802e762bf923c5c90ee9f9c4a3bfd8903df9a4d089e4ae3b7deae1a')

prepare() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release
    cmake -S tray -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr -DHGS_NATIVE_UI_PLUGIN=ON
    cmake --build build
    python scripts/collect-licenses.py "$srcdir/licenses"
}

check() {
    cd "$srcdir/zerus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$srcdir/zerus-$pkgver"
    python scripts/package-linux.py --destdir "$pkgdir" \
        --cli target/release/hgs --gui build/hgs-tray --native-ui-plugin build/plugins/libhgs-tray-native-ui.so \
        --licenses "$srcdir/licenses" --package-name "$pkgname"
}
