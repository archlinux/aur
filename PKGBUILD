pkgname=hdas
pkgver=1.6.0
pkgrel=1
pkgdesc="Track which packages create files in your home directory using eBPF"
arch=('x86_64')
url="https://github.com/adelmonte/hdas"
license=('GPL-3.0-only')
depends=('libbpf')
makedepends=('rust' 'clang')
options=(!lto)
install=hdas.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3d05d3a4a515b322924d8f9fc278aa745ba7d558ad0ab43744ef0ac588bd8c3')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hdas" "$pkgdir/usr/bin/hdas"

    # Shell completions
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    target/release/hdas completions bash > "$pkgdir/usr/share/bash-completion/completions/hdas"
    target/release/hdas completions zsh > "$pkgdir/usr/share/zsh/site-functions/_hdas"
    target/release/hdas completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/hdas.fish"

    # Man page
    install -dm755 "$pkgdir/usr/share/man/man1"
    target/release/hdas man-page > "$pkgdir/usr/share/man/man1/hdas.1"
}
