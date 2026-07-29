# Maintainer: Book-Enjoyer <catperson@catperson.online>
pkgname=volta-reader
pkgver=0.1.1
pkgrel=1
pkgdesc="Desktop ebook reader with RSVP speed reading — dual-mode TUI + LÖVE GUI"
arch=('x86_64')
url="https://git.komun.buzz/Book-Enjoyer/volta"
license=('MIT')
depends=('love' 'poppler' 'zenity' 'curl' 'gcc-libs')
makedepends=('cargo' 'rust')
conflicts=('volta')
source=("$pkgname-$pkgver.tar.gz::https://git.komun.buzz/Book-Enjoyer/volta/archive/v$pkgver.tar.gz")
sha256sums=('ea39bcc9391494642bdbdcc0ca7170867500b3beddb0425544d518649f7573b3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --manifest-path core/Cargo.toml
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --manifest-path core/Cargo.toml
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # TUI binary
    install -Dm755 target/release/volta-tui "$pkgdir/usr/bin/volta-tui"

    # Shared library for LÖVE
    install -Dm755 target/release/libvolta_core.so "$pkgdir/usr/lib/volta/libvolta_core.so"

    # LÖVE frontend
    install -dm755 "$pkgdir/usr/share/volta/frontend"
    cp -r frontend/* "$pkgdir/usr/share/volta/frontend/"

    # Launcher script
    install -Dm755 volta "$pkgdir/usr/bin/volta"

    # Desktop entry (with system path)
    sed 's|Exec=.*|Exec=/usr/bin/volta|' volta.desktop > "$srcdir/volta.desktop.system"
    install -Dm644 "$srcdir/volta.desktop.system" "$pkgdir/usr/share/applications/volta.desktop"

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/volta/README.md"
    install -Dm644 KEYBINDINGS.md "$pkgdir/usr/share/doc/volta/KEYBINDINGS.md"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/volta/LICENSE"
}
