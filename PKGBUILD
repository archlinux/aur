# Maintainer: Lecer69 <https://github.com/Lecer69>
pkgname=lssh
pkgver=0.3.2
pkgrel=1
pkgdesc="Simple SSH server manager"
arch=('x86_64')
url="https://github.com/Lecer69/LSSH"
license=('Unlicense')
depends=('openssh' 'dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/LSSH/archive/v$pkgver.tar.gz")
sha256sums=('b16336b6b3536fe13c8bd026514b9ab28c724707170fb9c8d24bf7b6dcbe39f0')

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
