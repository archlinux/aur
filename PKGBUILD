# Maintainer: Scqxd <scqxd@aur.archlinux.org>
# Generator: ArchForge v0.2.3

pkgname=archforge
pkgver=0.2.3
pkgrel=1
pkgdesc="AI-powered TUI for PKGBUILD generation and AUR management"
arch=('x86_64' 'aarch64')
url="https://github.com/Scqxd/archforge"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust')
optdepends=(
    'paru: AUR helper integration'
    'yay: AUR helper integration'
)
provides=('aur-manager' 'pkgbuild-generator')
conflicts=('archforge-git')
source=("https://github.com/Scqxd/archforge/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7dfe769aaed1776eeb4bb471af3363c722c6c51314a95104340607b6a84e929')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/archforge "$pkgdir/usr/bin/archforge"

    # Install bash completion
    install -Dm644 completions/archforge.bash \
        "$pkgdir/usr/share/bash_completion/completions/archforge" 2>/dev/null || true

    # Install fish completion
    install -Dm644 completions/archforge.fish \
        "$pkgdir/usr/share/fish/completions/archforge.fish" 2>/dev/null || true

    # Install man page (if exists)
    if [ -f target/release/archforge.1 ]; then
        install -Dm644 target/release/archforge.1 \
            "$pkgdir/usr/share/man/man1/archforge.1"
    fi
}