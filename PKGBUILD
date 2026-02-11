# Maintainer: ArchForge Team <archforge@example.com>
# Generator: ArchForge v0.1.0

pkgname=archforge-git
_pkgname=archforge
pkgver=0.1.0.r0.g${GIT_SHORT_SHA:-0}
pkgrel=1
pkgdesc="AI-powered TUI for PKGBUILD generation and AUR management"
arch=('x86_64' 'aarch64')
url="https://github.com/archforge/archforge"
license=('MIT')
depends=('rust' 'cargo' 'git')
makedepends=('cargo' 'git' 'openssl' 'pkgconf')
optdepends=(
    'makepkg: for building packages'
    'paru: AUR helper'
    'yay: AUR helper'
    'jq: for JSON processing'
)
checkdepends=()
provides=('archforge')
conflicts=('archforge')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Version based on git state
    if git describe --tags &>/dev/null; then
        git describe --tags --abbrev=0 | sed 's/v//'
    else
        printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked --all-features
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all-features
}

package() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable

    # Install binary
    install -Dm755 "target/release/archforge" "$pkgdir/usr/bin/archforge"

    # Install man page
    install -Dm644 "archforge.1" "$pkgdir/usr/share/man/man1/archforge.1"

    # Install bash completion
    install -Dm644 "completions/archforge.bash" \
        "$pkgdir/usr/share/bash-completion/completions/archforge"

    # Install fish completion
    install -Dm644 "completions/archforge.fish" \
        "$pkgdir/usr/share/fish/completions/archforge.fish"

    # Install zsh completion
    install -Dm644 "completions/_archforge" \
        "$pkgdir/usr/share/zsh/site-functions/_archforge"
}
