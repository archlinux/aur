# Maintainer: Mark Wells <contact@markwells.dev>
pkgname=anneal-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Proactive AUR rebuild management for Arch Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MarkWells-Dev/Anneal"
license=('GPL-3.0-or-later')
depends=('pacman')
optdepends=(
    'paru: AUR helper for rebuilding packages'
    'yay: AUR helper for rebuilding packages'
    'pikaur: AUR helper for rebuilding packages'
    'aura: AUR helper for rebuilding packages'
    'trizen: AUR helper for rebuilding packages'
    'rebuild-detector: detect packages needing rebuild via checkrebuild'
)
provides=('anneal')
conflicts=('anneal' 'anneal-git')
source=(
    "anneal-$pkgver-x86_64::$url/releases/download/v$pkgver/anneal-x86_64-linux"
    "anneal-trigger-$pkgver.hook::$url/releases/download/v$pkgver/anneal-trigger.hook"
    "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
)
sha256sums=('790a668a106e974504a463331faa8f14dd9775e4f40bb695cb5b8dde1a6bdc73'
            '10cfa2ed5510c7535437ac54097137262841131717ac73a221c5ebde3d050e88'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    # Binary
    install -Dm755 "anneal-$pkgver-x86_64" "$pkgdir/usr/bin/anneal"

    # Pacman hook
    install -Dm644 "anneal-trigger-$pkgver.hook" \
        "$pkgdir/usr/share/libalpm/hooks/anneal-trigger.hook"

    # Shell completions
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/anneal" completions bash > "$pkgdir/usr/share/bash-completion/completions/anneal"
    "$pkgdir/usr/bin/anneal" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_anneal"
    "$pkgdir/usr/bin/anneal" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/anneal.fish"

    # Config directory structure
    install -dm755 "$pkgdir/etc/anneal/triggers"
    install -dm755 "$pkgdir/etc/anneal/packages"

    # License
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
