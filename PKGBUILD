pkgname=hdas
pkgver=1.3.3
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
sha256sums=('ed727991a6df97f0b31cf629a48c63fa6b12fbb90b74a97f35dddda57e6f68a6')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hdas" "$pkgdir/usr/bin/hdas"
    install -Dm644 "hdas@.service" "$pkgdir/usr/lib/systemd/system/hdas@.service"

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
