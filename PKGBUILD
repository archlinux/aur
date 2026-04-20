# Maintainer:  aik2 <aik2mlj at gmail dot com>

pkgname=canvas-downloader
pkgver=0.4.1
pkgrel=1
pkgdesc='Download and organize all your course materials from Canvas LMS 📚'
arch=('x86_64')
url='https://github.com/aik2mlj/canvas-downloader'
license=('GPL-3.0-or-later')

depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
optdepends=(
    'bash-completion: bash completions'
    'zsh: zsh completions'
    'fish: fish completions'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f1384326e881a5612f87c190ccd94241fca88e71bfdf2d9c0c3d8fca9bbcaab')

build() {
    cd "$srcdir/canvas-downloader-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked
}

package() {
    cd "$srcdir/canvas-downloader-$pkgver"

    install -Dm755 "$CARGO_TARGET_DIR/release/canvas-downloader" "$pkgdir/usr/bin/canvas-downloader"

    # License (Arch convention)
    install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true

    # Completions
    install -d \
        "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d"

    # generate completions
    "$pkgdir/usr/bin/$pkgname" completions bash >"$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$pkgdir/usr/bin/$pkgname" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$pkgdir/usr/bin/$pkgname" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
