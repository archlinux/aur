# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus-git
pkgver=0.42.2.r880.g6de5bb0
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across your machines'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'kstatusnotifieritem' 'kwindowsystem' 'kidletime'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'libgcc' 'libstdc++' 'glibc' 'hicolor-icon-theme' 'bash' 'tar')
makedepends=('git' 'rust' 'cmake' 'ninja' 'qt6-webengine')
optdepends=('konsole: external KDE terminal integration'
            'qt6-webengine: embedded DeepSeek Native UI'
            'wl-clipboard: clipboard transfers on Wayland'
            'xclip: clipboard transfers on X11'
            'nodejs: separately installed native agents and DeepSeek Harness'
            'npm: install Codex and DeepSeek Harness from Accounts'
            'git: Git repository and worktree features'
            'systemd: user service autostart and isolated DeepSeek scopes')
provides=("zerus=$pkgver" 'hgs' 'hgs-tray')
conflicts=('zerus' 'zerus-ade-bin')
options=('!lto' '!debug')
source=('zerus::git+https://github.com/ufna/zerus.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/zerus"
    printf '%s.r%s.g%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/zerus"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/zerus"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release
    cmake -S tray -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr -DHGS_NATIVE_UI_PLUGIN=ON
    cmake --build build
    python scripts/collect-licenses.py "$srcdir/licenses"
}

check() {
    cd "$srcdir/zerus"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$srcdir/zerus"
    python scripts/package-linux.py --destdir "$pkgdir" \
        --cli target/release/hgs --gui build/hgs-tray --native-ui-plugin build/plugins/libhgs-tray-native-ui.so \
        --licenses "$srcdir/licenses" --package-name "$pkgname"
}
