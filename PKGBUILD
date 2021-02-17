# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=intermodal
pkgver=0.1.12
pkgrel=2
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
makedepends=(cargo help2man)
conflicts=(intermodal-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cd62894e519dc5aa0284a5f48aab86e1a45c3bc96b8a5481741adb6960d4751a')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked

    # completions and man pages
    # cargo run --package gen -- --bin target/release/imdl all --no-git
    cargo run --package gen -- --bin target/release/imdl completion-scripts
    cargo run --package gen -- --bin target/release/imdl man
    cargo run --package gen -- --bin target/release/imdl book --no-git
}

package() {
    cd "$pkgname-$pkgver"

    # binary
    install -Dm 755 "target/release/imdl" "$pkgdir/usr/bin/imdl"

    # shell completions
    install -Dm644 "target/gen/completions/_imdl" "$pkgdir/usr/share/zsh/site-functions/_imdl"
    install -Dm644 "target/gen/completions/imdl.bash" "$pkgdir/usr/share/bash-completion/completions/imdl"
    install -Dm644 "target/gen/completions/imdl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imdl.fish"

    # man pages
    install -Dm644 target/gen/man/*.1 -t "$pkgdir/usr/share/man/man1/"

    # book
    pushd book/src
    find . -name '*.md' -exec \
        install -Dm 644 {} $pkgdir/usr/share/doc/$pkgname/book/{} \;
    popd

    # license
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
