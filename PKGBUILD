# Maintainer: Anjishnu Sengupta <itsaemail@duck.com>
pkgname=ny-cli
pkgver=3.0.0
pkgrel=1
pkgdesc="Terminal-based anime streaming client with self-hosted scraping via aniwatch"
arch=('any')
url="https://github.com/AnjishnuSengupta/ny-cli"
license=('MIT')
depends=('nodejs>=18' 'npm' 'grep' 'sed')
optdepends=(
    'mpv: recommended video player'
    'vlc: alternative video player'
    'fzf: fuzzy finder for better menus'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnjishnuSengupta/ny-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install application to /usr/lib/ny-cli
    install -d "$pkgdir/usr/lib/$pkgname"
    install -Dm755 ny-cli "$pkgdir/usr/lib/$pkgname/ny-cli"
    install -Dm644 backend.mjs "$pkgdir/usr/lib/$pkgname/backend.mjs"
    install -Dm644 package.json "$pkgdir/usr/lib/$pkgname/package.json"

    # Install npm dependencies
    cd "$pkgdir/usr/lib/$pkgname"
    npm install --omit=dev --ignore-scripts 2>/dev/null || npm install --production --ignore-scripts 2>/dev/null

    # Symlink to /usr/bin
    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/$pkgname/ny-cli "$pkgdir/usr/bin/ny-cli"

    # Install license and docs
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
