pkgname=hdas-git
pkgver=1.0.0.r0.g22f96e5
pkgrel=1
pkgdesc="Track which packages create files in your home directory using eBPF"
arch=('x86_64')
url="https://github.com/adelmonte/hdas"
license=('GPL-3.0-only')
depends=('libbpf')
makedepends=('rust' 'clang' 'git')
provides=('hdas')
conflicts=('hdas')
options=(!lto)
install=hdas.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd hdas
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd hdas
    cargo build --release
}

package() {
    cd hdas
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
