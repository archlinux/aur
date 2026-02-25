# Maintainer: bbj <benigno at duck dot com>
# Contributor: Tim Visee <tim@visee.me>

pkgname=ffsend
pkgver=0.2.77
pkgrel=1
pkgdesc="Easily and securely share files from the command line. A Send client."
url="https://gitlab.com/timvisee/ffsend"
license=('GPL-3.0-or-later')
source=("https://gitlab.com/timvisee/ffsend/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c9f94dc548339f516d93ffaa40e305c926cddc4cc0a548e1c13b0ad7a6fecd8d')
arch=('x86_64' 'i686')
depends=('ca-certificates')
makedepends=('cargo' 'cmake' 'openssl>=1.0')
optdepends=('xclip: clipboard support'
            'bash-completion: support auto completion for bash')

prepare() {
    cd "$pkgname-v$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-v$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Shell completions
    install -Dm644 "contrib/completions/ffsend.bash" "$pkgdir/usr/share/bash-completion/completions/ffsend"
    install -Dm644 "contrib/completions/_ffsend" "$pkgdir/usr/share/zsh/site-functions/_ffsend"
    install -Dm644 "contrib/completions/ffsend.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ffsend.fish"

    # Documentation
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ffsend/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/ffsend/README.md"
}
