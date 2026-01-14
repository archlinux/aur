# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: ARKye03 <rafa03-dev@proton.me>

pkgname=lumen
pkgver=2.16.0
pkgrel=1
pkgdesc="Instant AI Git Commit message, Git changes summary from the CLI (no API key required)"
url="https://github.com/jnsahaj/lumen"
license=('MIT')
arch=('x86_64')
source=("https://github.com/jnsahaj/lumen/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
makedepends=('cargo')
depends=('git')
optdepends=(
    'fzf: Required for lumen list command'
    'mdcat: Required for pretty output formatting'
    'ollama: Local AI provider'
    'ollama-cuda: Local AI provider with CUDA'
    'ollama-rocm: Local AI provider with ROCm'
)
sha256sums=('a25e94123988775a17ce10ab491f5eacd8191821014d1118cafb94a4b11da3a8')
options=(!debug !lto)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    RUSTFLAGS='-C link-args=-Wl,-z,shstk' \
        cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
