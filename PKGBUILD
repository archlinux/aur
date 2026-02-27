# Maintainer: Eric Jingryd <tidynest@proton.me>
pkgname=linux-system-hardener
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux security automation: scanning, hardening, and rollback across 8 domains"
arch=('x86_64')
url="https://github.com/tidynest/linux-system-hardener"
license=('Apache-2.0')
depends=(
    'cairo'
    'desktop-file-utils'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'pango'
    'webkit2gtk-4.1'
    'libxcb'
    'libxkbcommon'
    'systemd'
)
makedepends=(
    'git'
    'openssl'
    'librsvg'
    'rust'
    'cargo'
    'trunk'
    'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tidynest/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5779be8f75f3cfeecae9e1c9118722a517726c15c516cdaaf5cbce9dc59b35a0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --target x86_64-unknown-linux-musl -p hardener-cli
    cd src-tauri && cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -Dm755 "target/x86_64-unknown-linux-musl/release/hardener" \
        "$pkgdir/usr/bin/hardener"
    install -Dm755 "src-tauri/target/release/linux-hardener-desktop" \
        "$pkgdir/usr/bin/linux-hardener-desktop"

    # Systemd units
    install -Dm644 "systemd/linux-hardener.service" \
        "$pkgdir/usr/lib/systemd/system/linux-hardener.service"
    install -Dm644 "systemd/linux-hardener.timer" \
        "$pkgdir/usr/lib/systemd/system/linux-hardener.timer"

    # Desktop entry
    install -Dm644 "data/linux-hardener.desktop" \
        "$pkgdir/usr/share/applications/linux-hardener.desktop"

    # Man page
    install -Dm644 "data/hardener.1" \
        "$pkgdir/usr/share/man/man1/hardener.1"

    # Polkit policy
    install -Dm644 "data/com.tidynest.linux-hardener.policy" \
        "$pkgdir/usr/share/polkit-1/actions/com.tidynest.linux-hardener.policy"

    # Default config
    install -Dm644 "data/config.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
    install -Dm644 "data/config.toml.example" \
        "$pkgdir/etc/linux-hardener/config.toml"

    # Directories
    install -dm755 "$pkgdir/etc/linux-hardener"
    install -dm755 "$pkgdir/var/lib/linux-hardener"
    install -dm700 "$pkgdir/var/log/linux-hardener"

    # Licence and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
