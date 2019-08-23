# Maintainer: Flaviu Tamas <me@flaviutamas.com>
pkgname=nushell-git
pkgver=r700.bc6c92b
pkgrel=2
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
    cd "$srcdir/$pkgname"
    RUSTFLAGS=-g cargo build --release
}

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cargo install --root="$pkgdir/usr" --path="$srcdir/$pkgname"
    rm "$pkgdir/usr/.crates.toml"
}
