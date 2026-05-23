# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=hypragent
pkgver=0.1.0
pkgrel=1
pkgdesc='AI chat agent for Hyprland - GTK4, multi-agent conversations, persistent RAG memory, Waybar integration'
arch=(x86_64)
url='https://github.com/hbuddenberg/hypragent'
license=(MIT)
depends=(gtk4 gtk4-layer-shell hyprland waybar)
makedepends=(cargo rust)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("fa054027583a8bae418a0722d9d115bac5fa021c44a06c8be97f39cf51ebf985")

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || return
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver" || return
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver" || return
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return

    # Binary
    install -Dm755 target/release/hypragent "${pkgdir}/usr/bin/hypragent"

    # Documentation
    install -dm755 "${pkgdir}/usr/share/doc/$pkgname"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/" 2>/dev/null || true
    install -Dm644 docs/*.md "${pkgdir}/usr/share/doc/$pkgname/" 2>/dev/null || true

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
