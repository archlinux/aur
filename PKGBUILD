pkgname=tabular
pkgver=0.5.23
pkgrel=1
pkgdesc="SQL and NoSQL database client"
arch=('x86_64' 'aarch64')
url="https://github.com/tabular-id/tabular"
license=('AGPL3' 'custom:Tabular-EULA')
# Add sqlite to depends/makedepends to ensure system lib present for dynamic tools even if bundled static is used.
depends=(gtk3 glib2 openssl libxcb libxkbcommon systemd-libs pango atk hicolor-icon-theme sqlite)
makedepends=(cargo clang pkgconf sqlite)
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
    # Force sqlx/libsqlite3-sys to prefer bundled static sqlite and avoid relying on possibly stripped system lib in macro loading.
    export LIBSQLITE3_SYS_BUNDLED=1
    # Ensure static link of bundled (alternative to old LIBSQLITE3_SYS_STATIC) for consistency.
    export LIBSQLITE3_SYS_STATIC=1
    # Optional: reduce risk of dynamic lookup by disabling dlopen (not provided by libsqlite3-sys, but keep flags minimal)
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
