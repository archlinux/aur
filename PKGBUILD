pkgname=tabular
pkgver=0.5.14
pkgrel=1
pkgdesc="SQL and NoSQL database client"
arch=('x86_64' 'aarch64')
url="https://github.com/tabular-id/tabular"
license=('AGPL3' 'custom:Tabular-EULA')
depends=(gtk3 glib2 openssl libxcb libxkbcommon systemd-libs pango atk hicolor-icon-theme)
makedepends=(cargo clang pkgconf)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tabular-id/tabular/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$srcdir/cargo"
    export CARGO_HOME="$srcdir/cargo"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo"
    export CARGO_TARGET_DIR="$srcdir/target"
    echo "Skipping upstream tests; they require database services not available during packaging"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "$srcdir/target/release/tabular" "$pkgdir/usr/bin/tabular"

    install -Dm644 tabular.desktop "$pkgdir/usr/share/applications/tabular.desktop"
    install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/tabular.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE-AGPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE-AGPL"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
