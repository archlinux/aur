# Maintainer: Book-Enjoyer <catperson@catperson.online>
pkgname=volta-reader
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop ebook reader with RSVP speed reading — dual-mode TUI + LÖVE GUI"
arch=('x86_64')
url="https://git.komun.buzz/Book-Enjoyer/volta"
license=('MIT')
depends=('love' 'poppler' 'zenity' 'curl' 'gcc-libs')
makedepends=('cargo' 'rust')
conflicts=('volta')
source=("$pkgname-$pkgver.tar.gz::https://git.komun.buzz/Book-Enjoyer/volta/archive/v$pkgver.tar.gz")
sha256sums=('e294a2e7429943612e9aeab1e02b51a9a8c833afc68555789e48c53bff1b455e')

build() {
    cd "$srcdir/volta"
    cargo build --release --manifest-path core/Cargo.toml
}

check() {
    cd "$srcdir/volta"
    cargo test --release --manifest-path core/Cargo.toml
}

package() {
    cd "$srcdir/volta"

    # TUI binary
    install -Dm755 target/release/volta-tui "$pkgdir/usr/bin/volta-tui"

    # Shared library for LÖVE
    install -Dm755 target/release/libvolta_core.so "$pkgdir/usr/lib/volta-reader/libvolta_core.so"

    # LÖVE frontend
    install -dm755 "$pkgdir/usr/share/volta-reader/frontend"
    cp -r frontend/* "$pkgdir/usr/share/volta-reader/frontend/"

    # Launcher script
    install -Dm755 volta "$pkgdir/usr/bin/volta"

    # Desktop entry
    sed 's|Exec=.*|Exec=/usr/bin/volta|' volta.desktop > "$srcdir/volta.desktop.system"
    install -Dm644 "$srcdir/volta.desktop.system" "$pkgdir/usr/share/applications/volta-reader.desktop"

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/volta-reader/README.md"
    install -Dm644 KEYBINDINGS.md "$pkgdir/usr/share/doc/volta-reader/KEYBINDINGS.md"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/volta-reader/LICENSE"
}
