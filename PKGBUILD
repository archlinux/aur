# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=rasusa
_pkgname=rasusa
_tag=5.1.0
pkgver=5.1.0
pkgrel=1
pkgdesc="Random subsampling of sequencing reads and alignments to a specified coverage"
arch=('x86_64' 'aarch64')
url="https://github.com/mbhall88/$_pkgname"
license=('MIT')
depends=('glibc' 'libgcc' 'bzip2' 'xz')
makedepends=('rust' 'cmake' 'pkgconf')
# Upstream's release profile already strips symbols and enables Rust LTO.
options=('!lto' '!debug')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$_tag.tar.gz")
sha256sums=('c58ee8cdb2e40c921fbef4b8ceffcb7999687b473152f942a6bda0089da6b256')

prepare() {
    cd "$_pkgname-$_tag"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$_pkgname-$_tag"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --frozen
}

check() {
    cd "$_pkgname-$_tag"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --release --frozen
}

package() {
    cd "$_pkgname-$_tag"
    install -Dm755 target/release/rasusa "$pkgdir/usr/bin/rasusa"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
