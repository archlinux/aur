# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=license
pkgver=2.4.0
pkgrel=3
pkgdesc="A tool to easily add a license to your project"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/license/"
license=('MPL-2.0')
source=("https://git.sr.ht/~zethra/license/archive/$pkgver.tar.gz")
makedepends=('rust' 'cargo' 'scdoc')
optdepends=(
    'fzf: required for interactive scripts: set-license, copy-header'
    'xclip: required for interactive scripts: set-license, copy-header'
)
sha256sums=("a6534c942a98d7709674508ce6c29cd76d1deec060bcc9b2de219160a042af1e")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked --all-features
    scdoc < doc/license.scd > license.1
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m755 "$srcdir/$pkgname-$pkgver/scripts/set-license" "$pkgdir/usr/bin/set-license"
    install -D -m755 "$srcdir/$pkgname-$pkgver/scripts/copy-header" "$pkgdir/usr/bin/copy-header"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/$pkgname-$pkgver/license.1" "$pkgdir/usr/share/man/man1/license.1"

    install -D -m644 "$srcdir/$pkgname-$pkgver/completions/license.bash" \
                     "$pkgdir/usr/share/bash-completion/completions/license"
    install -D -m644 "$srcdir/$pkgname-$pkgver/completions/_license" \
                     "$pkgdir/usr/share/zsh/site-functions/_license"
    install -D -m644 "$srcdir/$pkgname-$pkgver/completions/license.fish" \
                     "$pkgdir/usr/share/fish/vendor_completions.d/license.fish"
}
