# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus
pkgver=0.38.0
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across your machines'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'qt6-svg' 'kstatusnotifieritem' 'kwindowsystem' 'kidletime'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'libgcc' 'libstdc++' 'glibc' 'hicolor-icon-theme' 'bash' 'tar')
makedepends=('rust' 'cmake' 'ninja')
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
sha256sums=('cc15d69803ffdb20f75a89eb60202fe7f04b70f0ead918dcc7306a498b29d37d')

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
        -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel 2
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
        --cli target/release/hgs --gui build/hgs-tray --licenses "$srcdir/licenses" --package-name "$pkgname"
}
