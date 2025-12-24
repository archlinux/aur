# Maintainer: oxyzenq <with dot rezky at gmail dot com>

pkgname=lyvoxa-bin
pkgver=3.1.2
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
sha256sums=('2848247d8864c7350e92e9de4a65127d1b51d728b065a72b9a09a6a06d5f7479' 'c8dde257b8c17c1c8f8097ae3774b7af2f364ba920a4e1f918f5d1ee8509eb4d' '509dedd6de2434ea33a98f466598a206d4ffd28274043780e7f38dbab50786ab' )
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
