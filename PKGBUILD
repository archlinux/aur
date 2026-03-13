# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgbase=rustledger-bin
pkgname=(rustledger-bin rustledger-bin-bean-compat)
pkgver=0.10.1
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rustledger/rustledger/v${pkgver}/LICENSE")
source_x86_64=("${pkgbase}-${pkgver}-x86_64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${pkgver}/rustledger-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgbase}-${pkgver}-aarch64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${pkgver}/rustledger-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('04cb93596dcf98bb4eff2968b8776a11cee7a064b790126699e71d50cc426e23')
sha256sums_aarch64=('229d7ca0e334dbd0fce08ffc0486e8ce98a31d5c785a923a6f615d785781370f')

package_rustledger-bin() {
    pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting (pre-built binary)"
    provides=("rustledger=$pkgver")
    conflicts=('rustledger')

    # Install main binaries
    install -Dm755 rledger "$pkgdir/usr/bin/rledger"
    install -Dm755 rledger-lsp "$pkgdir/usr/bin/rledger-lsp"

    # Install shell completions
    install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/rledger" < <(./rledger completions bash)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_rledger" < <(./rledger completions zsh)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/rledger.fish" < <(./rledger completions fish)

    # Install license
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_rustledger-bin-bean-compat() {
    pkgdesc="Beancount-compatible bean-* commands for rustledger (drop-in replacement, pre-built binary)"
    depends=('rustledger-bin')
    conflicts=('beancount' 'rustledger-bean-compat')
    provides=('beancount' 'rustledger-bean-compat')

    # Install beancount compatibility binaries
    for bin in bean-check bean-format bean-query bean-report bean-doctor bean-extract bean-price; do
        if [[ -f "$bin" ]]; then
            install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
        fi
    done

    # Install license
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
