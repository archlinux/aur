# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=nog
pkgver=1.4.0
pkgrel=1
pkgdesc="A tier-aware package manager for Arch Linux — pacman with a safety net, written in Rust"
arch=('x86_64')
url="https://github.com/jetomev/nog"
license=('GPL-3.0-or-later')
depends=('pacman' 'pacman-contrib')
makedepends=('rust' 'cargo')
optdepends=(
    'yay: AUR helper integration (preferred if installed)'
    'paru: AUR helper integration (alternative)'
)
# Preserve user modifications to these files across upgrades — pacman will
# write .pacnew next to them instead of overwriting. Without this, running
# `nog pin` to customize tier-pins.toml would get silently clobbered the next
# time the AUR ships a new nog version with a different default.
backup=('etc/nog/nog.conf' 'etc/nog/tier-pins.toml')
# SKIP is the submission-time placeholder. Before pushing to AUR, run
# `updpkgsums` in the AUR clone to replace SKIP with the real sha256 of the
# signed GitHub release tarball for the tag being packaged.
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('5849f3e00281f65e0813b046b8fb1e7e501f4105e4b2bb5cd54f919af50f6d9b'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   gpg --keyserver keys.openpgp.org --recv-keys 32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E
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
