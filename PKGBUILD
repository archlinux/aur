# Maintainer: Flaviu Tamas <me@flaviutamas.com>
pkgname=nushell-git
pkgver=r946.4a00887
pkgrel=5
makedepends=('rust-nightly' 'cargo')
depends=('openssl' 'zlib')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A shell for the GitHub era"
source=("$pkgname::git+https://github.com/nushell/nushell")
url="http://nushell.sh"
license=('MIT')
sha256sums=('SKIP')

build() {
    return 0
}

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    case "$CFLAGS" in  *"-g"*) export RUSTFLAGS="-g";; esac
    cd "$srcdir/$pkgname"
    # user may not be using rustup, so always succeed
    rustup override set nightly || true
    cargo install --root="$pkgdir/usr" --path=. --locked --features raw-key,clipboard
    rm "$pkgdir/usr/.crates.toml"
}
