pkgname=lumen-journal
pkgver=2.2.3
pkgrel=1
pkgdesc="Encrypted journal app built with Rust and Flutter"
arch=('x86_64')
url="https://github.com/crazygiscool/lumen"
license=('custom')
depends=('glibc' 'gcc-libs' 'gtk3' 'sqlite')
makedepends=('git' 'cargo' 'flutter' 'cmake' 'ninja' 'pkg-config')

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

    # Ensure we are at the workspace root and build everything
    # We use -p lumen to explicitly build the cdylib
    cargo build --workspace --release --locked

    # Find the compiled library and binary (robust against different target locations)
    LIB_PATH=$(find target -name "liblumen_core.so" | grep -v "deps" | head -n 1)
    TUI_PATH=$(find target -name "lumen" | grep -v "deps" | head -n 1)

    if [ -z "$LIB_PATH" ]; then
        echo "Error: liblumen_core.so not found in target directory"
        ls -R target/release
        exit 1
    fi

    # Copy Rust library into Flutter linux/lib
    install -Dm755 "$LIB_PATH" ui/linux/lib/liblumen_core.so

    # Build Flutter UI
    cd ui
    flutter build linux --release
}

package() {
    cd "$srcdir/$pkgname"

    # Find binaries again for packaging
    TUI_PATH=$(find target -name "lumen" | grep -v "deps" | head -n 1)

    # Install TUI binary
    install -Dm755 "$TUI_PATH" "$pkgdir/usr/bin/lumen-cli"

    cd ui/build/linux/x64/release/bundle

    # Install the entire bundle to /usr/lib/lumen-journal/
    install -d "$pkgdir/usr/lib/lumen-journal"
    cp -r Lumen lib data "$pkgdir/usr/lib/lumen-journal/"

    # Symlink in PATH
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/lumen-journal/Lumen" "$pkgdir/usr/bin/lumen-journal"

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
