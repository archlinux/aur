# Maintainer: Lecer69 <https://github.com/Lecer69>
pkgname=lssh
pkgver=0.4.2
pkgrel=1
pkgdesc="Simple SSH server manager"
arch=('x86_64')
url="https://github.com/Lecer69/LSSH"
license=('Unlicense')
depends=('openssh' 'dbus')
makedepends=('cargo')
options=('!debug')
# pkgver, pkgrel and sha256sums are filled in by .github/workflows/aur.yml on release.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/LSSH/archive/v$pkgver.tar.gz")
sha256sums=('7b1b2ed6cf36b8783a8e6dbac210be4911a194f196e57114b1e4ad0909265637')

build() {
    cd "LSSH-$pkgver"
    cargo build --release
}

package() {
    cd "LSSH-$pkgver"
    install -Dm755 target/release/lssh "$pkgdir/usr/bin/lssh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lssh/README.md"

    local completions="$pkgdir/usr/share"
    install -dm755 "$completions/bash-completion/completions" \
        "$completions/zsh/site-functions" "$completions/fish/vendor_completions.d"
    target/release/lssh completions bash > "$completions/bash-completion/completions/lssh"
    target/release/lssh completions zsh > "$completions/zsh/site-functions/_lssh"
    target/release/lssh completions fish > "$completions/fish/vendor_completions.d/lssh.fish"
}
