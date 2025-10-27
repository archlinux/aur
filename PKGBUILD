# Maintainer: oxyzenq <with dot rezky at gmail dot com>

pkgname=lyvoxa-bin
pkgver=3.0
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
sha256sums=('38efbc27d3afac3fa87861c52e1e42436665fc6fdac0b6b9f8d70c7e1be82f61' 'dc18a8e8eb43f69bccc4718702c1f727df50b84791c261ff8be088adc1cdfcc1' '9479eaa553c1edd0686757197f580dee7a901f9abd3e02c2452937e4327a7ae4' )
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
