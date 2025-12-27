# Maintainer: jakeb-grant
pkgname=upkeep-git
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI for managing Arch Linux updates, packages, and system maintenance"
arch=('x86_64')
url="https://github.com/jakeb-grant/upkeep"
license=('MIT')
depends=('pacman')
optdepends=(
    'yay: AUR support (default helper)'
    'paru: AUR support (alternative helper)'
    'paccache: cache cleanup feature'
    'wl-copy: clipboard support on Wayland'
    'xclip: clipboard support on X11'
)
makedepends=('cargo' 'git')
provides=('upkeep')
conflicts=('upkeep')
source=("git+https://github.com/jakeb-grant/upkeep.git")
sha256sums=('SKIP')

pkgver() {
    cd upkeep
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd upkeep
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd upkeep
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd upkeep
    install -Dm755 "target/release/upkeep" "$pkgdir/usr/bin/upkeep"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
