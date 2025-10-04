# Maintainer: dqnk <dqnk.6375@pm.me>
# Contributor: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=millet
pkgver=0.14.9
pkgrel=1
pkgdesc="Language server implementation for Standard ML"
url="https://github.com/azdavis/millet"
arch=('x86_64')
license=(APACHE MIT)
makedepends=('cargo')
source=("$pkgname-$pkgver.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5efff3cafade17b33a8b9b2748a8c064dbd51932934de01f8d2a14c88ac829c5')

build() {
    cd "$pkgname-$pkgver"
    # Doesn't use xtask to avoid building the VSCode extension
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/millet-ls" "$pkgdir/usr/bin/millet"
    install -Dm644 "LICENSE-MIT.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

check() {
    cd "$pkgname-$pkgver"

    # Doesn't use xtask because some checks require we're in a git repo (rely
    # on git grep), and this also requires the installer to have xtask
    # installed.
    cargo fmt -- --check

    # NOTE: (dqnk)
    # We skip clippy because the package is not using it at this point in time.
    # cargo clippy

    # Ignores tests starting with repo. These tests assume we're in a git repo
    # (we're not, here, since this is a source tarball), and test for things
    # like changelog entries existing.
    cargo test --locked -- --skip repo
}
