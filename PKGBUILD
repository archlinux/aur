pkgname=lumen-journal
pkgver=1.1.27
pkgrel=1
pkgdesc="Encrypted journal app built with Rust and Flutter"
arch=('x86_64')
url="https://github.com/crazygiscool/lumen"
license=('custom')
depends=()
makedepends=('git' 'cargo' 'flutter')

source=("$pkgname::git+https://github.com/crazygiscool/Lumen.git#tag=v$pkgver"
        "lumen-journal.desktop"
        "lumen-journal.png"
        "lumen-journal.appdata.xml"
        "lumen-journal.1"
        "lumen-journal.bash"
        "_lumen-journal"
        "lumen-journal.fish")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir/$pkgname"

    # Build Rust core
    cd core
    cargo build --release --locked

    # Copy Rust library into Flutter linux/lib
    install -Dm755 target/release/liblumen_core.so ../ui/linux/lib/liblumen_core.so

    # Build Flutter UI
    cd ../ui
    flutter build linux --release
}

package() {

    cd "$srcdir/$pkgname/ui/build/linux/x64/release/bundle"

    # Install binary
    install -Dm755 Lumen "$pkgdir/usr/bin/lumen-journal"

    # Install license
    install -Dm644 "$srcdir/$pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop file
    install -Dm644 "$srcdir/lumen-journal.desktop" \
        "$pkgdir/usr/share/applications/lumen-journal.desktop"

    # Icon
    install -Dm644 "$srcdir/lumen-journal.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/lumen-journal.png"

    # AppStream metadata
    install -Dm644 "$srcdir/lumen-journal.appdata.xml" \
        "$pkgdir/usr/share/metainfo/lumen-journal.appdata.xml"

    # Man page
    install -Dm644 "$srcdir/lumen-journal.1" \
        "$pkgdir/usr/share/man/man1/lumen-journal.1"

    # Shell completions
    install -Dm644 "$srcdir/lumen-journal.bash" \
        "$pkgdir/usr/share/bash-completion/completions/lumen-journal"

    install -Dm644 "$srcdir/_lumen-journal" \
        "$pkgdir/usr/share/zsh/site-functions/_lumen-journal"

    install -Dm644 "$srcdir/lumen-journal.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/lumen-journal.fish"
}

# vim:set ts=2 sw=2 et: