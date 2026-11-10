# Maintainer: Lecer69 <https://github.com/Lecer69>
pkgname=lssh
pkgver=0.4.1
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
sha256sums=('e55fe28113a26ba3c4f19164789ad1cc6ddf3479e207733a9f05ab00d9fcde12')

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
