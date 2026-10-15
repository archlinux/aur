# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=nog
pkgver=1.9.0
pkgrel=1
pkgdesc="A tier-aware package manager for Arch Linux — pacman with a safety net, written in Rust; one install command for the repositories, the AUR, Flatpak and Snap. Arch Linux and Arch-based distributions; no desktop needed; works on a plain text console (tty)"
arch=('x86_64')
url="https://github.com/jetomev/nog"
license=('GPL-3.0-or-later')
# sudo: every change nog makes runs through it (not in Arch's base). zstd: linked directly (the system
# libzstd, Cargo.toml's zstd-sys pkg-config feature). Both found by the 2026-10-11 dependency audit.
depends=('pacman' 'pacman-contrib' 'fakeroot' 'sudo' 'zstd')
makedepends=('rust' 'cargo')
optdepends=(
    'yay: AUR helper integration (preferred if installed)'
    'paru: AUR helper integration (alternative)'
    'flatpak: Flatpak apps installed, removed and updated through nog (offered when the install chain reaches it; off when absent)'
    'snapd: snaps installed, removed and updated through nog (offered when the install chain reaches it; off when absent)'
)
# Preserve user modifications to these files across upgrades — pacman will
# write .pacnew next to them instead of overwriting. Without this, running
# `nog pin` to customize tier-pins.toml would get silently clobbered the next
# time the AUR ships a new nog version with a different default.
backup=('etc/nog/nog.conf' 'etc/nog/tier-pins.toml')
# v1.8.0: no debug package — the release binary carries no debug symbols, and
# makepkg's attempt printed "No debugging symbols" in every build (Javier, 4 Oct)
options=('!debug')
# SKIP is the submission-time placeholder. Before pushing to AUR, run
# `updpkgsums` in the AUR clone to replace SKIP with the real sha256 of the
# signed GitHub release tarball for the tag being packaged.
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('ff56889c5ef099eb461bd20f653faabba109d5a65da856df4b6a7c20dab47093'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

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

    # Binary
    install -Dm755 target/release/nog "$pkgdir/usr/bin/nog"

    # Default configs under /etc/nog/
    install -Dm644 config/nog.conf        "$pkgdir/etc/nog/nog.conf"
    install -Dm644 config/tier-pins.toml  "$pkgdir/etc/nog/tier-pins.toml"

    # Man page
    install -Dm644 nog.1 "$pkgdir/usr/share/man/man1/nog.1"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
