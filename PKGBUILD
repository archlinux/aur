# Maintainer: ind4skylivey <your.email@example.com>
# MateriaTrack - Final Fantasy-themed CLI time tracker

pkgname=materiatrack
pkgver=1.0.3
pkgrel=1
pkgdesc="Mystical Final Fantasy-themed CLI time tracker based on Zeit"
arch=('x86_64' 'aarch64')
url="https://github.com/ind4skylivey/matteria-track"
license=('MIT')
depends=('sqlite' 'gnupg')
makedepends=('rust' 'cargo')
optdepends=(
    'libnotify: desktop notifications'
    'git: git commit integration'
)
provides=('materiatrack' 'mtrack')
conflicts=('materiatrack-git' 'materiatrack-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ind4skylivey/matteria-track/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9958f84456b9cc9673d73fa1758866030f49ff277b6f7ca18e43c04199fe8096')

prepare() {
    cd "$srcdir/matteria-track-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/matteria-track-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/matteria-track-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/matteria-track-$pkgver"

    install -Dm755 "target/release/materiatrack" "$pkgdir/usr/bin/materiatrack"

    ln -s materiatrack "$pkgdir/usr/bin/mtrack"

    if [ -f "man/materiatrack.1" ]; then
        install -Dm644 "man/materiatrack.1" "$pkgdir/usr/share/man/man1/materiatrack.1"
    fi

    if [ -f "completions/materiatrack.bash" ]; then
        install -Dm644 "completions/materiatrack.bash" \
            "$pkgdir/usr/share/bash-completion/completions/materiatrack"
    fi
    if [ -f "completions/_materiatrack" ]; then
        install -Dm644 "completions/_materiatrack" \
            "$pkgdir/usr/share/zsh/site-functions/_materiatrack"
    fi
    if [ -f "completions/materiatrack.fish" ]; then
        install -Dm644 "completions/materiatrack.fish" \
            "$pkgdir/usr/share/fish/vendor_completions.d/materiatrack.fish"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=4 sw=4 et:
