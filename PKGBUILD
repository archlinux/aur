# Maintainer: Ryan Sinn <pacselect@ryansinn.com>
pkgname=pacselect
pkgver=0.6.2
pkgrel=1
pkgdesc="Selective pacman updater — safely updates apps without touching system/core or KDE session packages"
arch=('x86_64' 'aarch64')
url="https://github.com/ryansinn/pacselect"
license=('GPL-3.0-or-later')
depends=('pacman' 'sudo' 'pacman-contrib')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe3322539ec63e4b29e0afd96a86de3ad3b13d5cad798d3b36ca829409f911cb')

# To build from a local checkout instead of a tarball, comment out
# the source/sha256sums lines above and use:
#
#   cd /path/to/pacselect
#   makepkg -si

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Sample config (installed as a reference under /usr/share)
    install -d "$pkgdir/usr/share/$pkgname"
    "target/release/$pkgname" --gen-config \
        > "$pkgdir/usr/share/$pkgname/config.toml.example"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
