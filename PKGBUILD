# Maintainer: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

_pkgname=nushell
pkgname=$_pkgname-git
pkgver=0.15.0.r2.ga268e825
pkgrel=1
makedepends=('rust' 'cargo' 'python' 'git')
# libx11 required for stable preset
depends=('openssl' 'zlib' 'e2fsprogs' 'libx11' 'curl')
optdepends=('libxcb')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A new type of shell"
source=("$pkgname::git+https://github.com/nushell/nushell.git")
url="https://www.nushell.sh"
license=('MIT')
sha256sums=('SKIP')

build() {
    return 0
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    case "$CFLAGS" in  *"-g"*) export RUSTFLAGS="-g";; esac
    cd "$srcdir/$pkgname"

    # user may not be using rustup, so always succeed
    rustup override set stable || true

    cargo install \
        --locked \
        --path . \
        --features stable \
        --root="$pkgdir/usr"

    rm "$pkgdir/usr/.crates.toml" "$pkgdir/usr/.crates2.json"
}
