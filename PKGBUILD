# Maintainer: oxyzenq <with dot rezky at gmail dot com>

pkgname=lyvoxa-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='Optimize Linux system monitor with real-time TUI built in Rust (precompiled binary)'
arch=('x86_64')
url='https://github.com/oxyzenQ/lyvoxa'
license=('GPL3')
depends=('glibc')
provides=('lyvoxa')
conflicts=('lyvoxa' 'lyvoxa-git')
options=('!strip')
source=(
    "lyvoxa-${pkgver}-linux-amd64.tar.gz::https://github.com/oxyzenQ/lyvoxa/releases/download/${pkgver}/lyvoxa-${pkgver}-linux-amd64.tar.gz"
    "lyvoxa-${pkgver}-linux-amd64.tar.gz.sha256::https://github.com/oxyzenQ/lyvoxa/releases/download/${pkgver}/lyvoxa-${pkgver}-linux-amd64.tar.gz.sha256"
    "lyvoxa-${pkgver}-linux-amd64.tar.gz.asc::https://github.com/oxyzenQ/lyvoxa/releases/download/${pkgver}/lyvoxa-${pkgver}-linux-amd64.tar.gz.asc"
)
sha256sums=('3238aae2b8b862482ff6bba155460d6d80014b19e98d11b054d6f5e4bfacc337' '0ab8373534d1ecc5db9b43320bad655516545a2aa2efaa79fe0c709d01d7f3ab' 'SKIP' )
validpgpkeys=('3495ABF0957D28A7E85013750D8D13BB989AF9F0') # Rezky Cahya Sahputra (Investor)

prepare() {
    cd "$srcdir"

    echo "==> Verifying SHA256 checksum..."
    sha256sum -c "lyvoxa-${pkgver}-linux-amd64.tar.gz.sha256" || {
        error "SHA256 checksum verification failed!"
        return 1
    }

    echo "==> Verifying GPG signature..."
    gpg --verify "lyvoxa-${pkgver}-linux-amd64.tar.gz.asc" "lyvoxa-${pkgver}-linux-amd64.tar.gz" || {
        warning "GPG signature verification failed. This might be expected if you haven't imported the public key."
        warning "To import: gpg --keyserver hkps://keys.openpgp.org --recv-keys 0D8D13BB989AF9F0"
    }
}

package() {
    cd "$srcdir/lyvoxa-${pkgver}-linux-amd64"

    # Install main binary
    install -Dm755 "bin/lyvoxa" "$pkgdir/usr/bin/lyvoxa"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install changelog if available
    [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim:set ts=4 sw=4 et:
