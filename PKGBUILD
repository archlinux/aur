# Maintainer: Daniele Salatti <daniele@salatti.dev>
pkgname=reth-gnosis
pkgver=1.0.1
pkgrel=1
pkgdesc="Gnosis Chain execution client built on Reth (Rust Ethereum)"
arch=('x86_64')
url="https://github.com/gnosischain/reth_gnosis"
license=('MIT' 'Apache-2.0')
options=(!lto)
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'clang' 'cmake' 'pkg-config' 'openssl' 'git')
provides=('reth-gnosis')
conflicts=('reth-gnosis-git')
install=reth-gnosis.install
backup=('etc/reth-gnosis/config.toml')
source=("$pkgname-$pkgver::git+https://github.com/gnosischain/reth_gnosis.git#tag=v$pkgver"
        'reth-gnosis.service'
        'reth-gnosis.sysusers'
        'reth-gnosis.tmpfiles')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/reth" "$pkgdir/usr/bin/reth-gnosis"

    # Systemd service
    install -Dm644 "$srcdir/reth-gnosis.service" "$pkgdir/usr/lib/systemd/system/reth-gnosis.service"

    # System user
    install -Dm644 "$srcdir/reth-gnosis.sysusers" "$pkgdir/usr/lib/sysusers.d/reth-gnosis.conf"

    # Tmpfiles (creates data dirs)
    install -Dm644 "$srcdir/reth-gnosis.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/reth-gnosis.conf"

    # Default config dir
    install -dm755 "$pkgdir/etc/reth-gnosis"

    # Generate default config
    "$pkgdir/usr/bin/reth-gnosis" config --chain gnosis > "$pkgdir/etc/reth-gnosis/config.toml" 2>/dev/null || true

    # License
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" 2>/dev/null || true
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" 2>/dev/null || true

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
