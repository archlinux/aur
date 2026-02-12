# Maintainer: Mark Wells <contact@markwells.dev>
pkgname=anneal
_reponame=Anneal
pkgver=0.2.3
pkgrel=1
pkgdesc="Proactive AUR rebuild management for Arch Linux"
arch=('x86_64')
url="https://github.com/MarkWells-Dev/Anneal"
license=('GPL-3.0-or-later')
depends=('pacman' 'sqlite')
makedepends=('cargo')
optdepends=(
    'paru: AUR helper for rebuilding packages'
    'yay: AUR helper for rebuilding packages'
    'pikaur: AUR helper for rebuilding packages'
    'aura: AUR helper for rebuilding packages'
    'trizen: AUR helper for rebuilding packages'
    'rebuild-detector: detect packages needing rebuild via checkrebuild'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7282dacd0fbe1d665324e4221cc9daa256b3718e2a2519411fbe84e56111de1d')

prepare() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$_reponame-$pkgver"

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
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
