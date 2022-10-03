# Maintainer: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=millet
pkgver=0.3.12
pkgrel=1
pkgdesc="Language server implementation for Standard ML"
url="https://github.com/azdavis/millet"
arch=('x86_64')
license=(APACHE MIT)
makedepends=('cargo')
source=("$pkgname-$pkgver.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('bd7e6d409e0daeca1fa07bcaf6738ecb')

build() {
    cd "$pkgname-$pkgver"
    # Doesn't use xtask to avoid building the VSCode extension
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/lang-srv" "$pkgdir/usr/bin/millet"
    install -Dm644 "license-mit.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

check() {
    cd "$pkgname-$pkgver"

    # Doesn't use xtask because some checks require we're in a git repo (rely
    # on git grep), and this also requires the installer to have xtask
    # installed.
    cargo fmt -- --check
    cargo clippy
    cargo test --locked
}
