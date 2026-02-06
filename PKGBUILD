# Maintainer: Mark Wells <contact@markwells.dev>
pkgname=anneal-bin
pkgver=0.1.0
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
    "$url/releases/download/v$pkgver/anneal-x86_64-linux"
    "$url/releases/download/v$pkgver/anneal-trigger.hook"
    "$url/raw/v$pkgver/LICENSE"
)
sha256sums=('b1c2b5850b3542548efa8855590bc1dac03cc3b525a86a6ea7640594913ef344'
            '10cfa2ed5510c7535437ac54097137262841131717ac73a221c5ebde3d050e88'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    # Binary
    install -Dm755 anneal-x86_64-linux "$pkgdir/usr/bin/anneal"

    # Pacman hook
    install -Dm644 anneal-trigger.hook \
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
