pkgname=lumen-journal
pkgver=1.1.26
pkgrel=1
pkgdesc="Encrypted journal app built with Rust and Flutter"
arch=('x86_64')
url="https://github.com/crazygiscool/lumen"
license=('custom')
depends=()
makedepends=()
DLAGENTS=("https::/usr/bin/curl -L -A 'Mozilla/5.0' -o %o %u")

source=("$pkgname-$pkgver.tar.gz::https://release-assets.githubusercontent.com/github-production-release-asset/1045288007/c49a3971-ac1b-4e47-bdff-56c134f1618f?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-12-30T14%3A08%3A37Z&rscd=attachment%3B+filename%3DLumen-$pkgver.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-12-30T13%3A07%3A55Z&ske=2025-12-30T14%3A08%3A37Z&sks=b&skv=2018-11-09&sig=XxQSsmdoNjSYIhQljPnGQzjjWH8j6%2BQe9P3%2FQYiravg%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2NzEwMjA1OSwibmJmIjoxNzY3MTAwMjU5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.NPo2GRdo25spgrw_zCy2xllxoMC5zvobTA3DnHCnkXw&response-content-disposition=attachment%3B%20filename%3DLumen-$pkgver.tar.gz&response-content-type=application%2Foctet-stream"
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
    cd "$srcdir/Lumen-$pkgver"

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
    cd "$srcdir/Lumen-$pkgver/ui/build/linux/x64/release/bundle"

    # Install binary
    install -Dm755 Lumen "$pkgdir/usr/bin/lumen-journal"

    # Install license
    install -Dm644 "$srcdir/Lumen-$pkgver/LICENSE" \
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