# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=intermodal
pkgver=0.1.10
pkgrel=1
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
makedepends=(cargo help2man)
conflicts=(intermodal-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8bb3e4f549e5c4446543babd741fec0cd7c42da4d49eca3e98c5f7611ad59618')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
    # completions and man pages
    # cargo run --package gen -- --bin target/release/imdl completion-scripts
    # cargo run --package gen -- --bin target/release/imdl man
    cargo run --package gen -- --bin target/release/imdl all --no-git
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

    # license
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
