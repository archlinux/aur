# Maintainer: Mark Wells <contact@markwells.dev>
pkgname=anneal-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Proactive AUR rebuild management for Arch Linux (git version)"
arch=('x86_64')
url="https://github.com/MarkWells-Dev/Anneal"
license=('GPL-3.0-or-later')
depends=('pacman' 'sqlite')
makedepends=('cargo' 'git')
optdepends=(
    'paru: AUR helper for rebuilding packages'
    'yay: AUR helper for rebuilding packages'
    'pikaur: AUR helper for rebuilding packages'
    'aura: AUR helper for rebuilding packages'
    'trizen: AUR helper for rebuilding packages'
    'rebuild-detector: detect packages needing rebuild via checkrebuild'
)
provides=('anneal')
conflicts=('anneal')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd Anneal
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd Anneal
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd Anneal
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd Anneal
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd Anneal

    # Binary
    install -Dm755 target/release/anneal "$pkgdir/usr/bin/anneal"

    # Pacman hook
    install -Dm644 contrib/anneal-trigger.hook \
        "$pkgdir/usr/share/libalpm/hooks/anneal-trigger.hook"

    # Shell completions
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

    target/release/anneal completions bash > "$pkgdir/usr/share/bash-completion/completions/anneal"
    target/release/anneal completions zsh > "$pkgdir/usr/share/zsh/site-functions/_anneal"
    target/release/anneal completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/anneal.fish"

    # Config directory structure
    install -dm755 "$pkgdir/etc/anneal/triggers"
    install -dm755 "$pkgdir/etc/anneal/packages"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
