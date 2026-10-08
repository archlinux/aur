# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus-git
pkgver=0.37.0.r58.g998bc4e
pkgrel=1
pkgdesc='An agent development environment for persistent local and remote tmux sessions'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'qt6-svg' 'kstatusnotifieritem' 'kwindowsystem'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'libgcc' 'libstdc++' 'glibc' 'hicolor-icon-theme' 'bash' 'tar')
makedepends=('git' 'rust' 'cmake' 'ninja')
optdepends=('konsole: external KDE terminal integration'
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
        -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel 2
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
        --cli target/release/hgs --gui build/hgs-tray --licenses "$srcdir/licenses" --package-name "$pkgname"
}
