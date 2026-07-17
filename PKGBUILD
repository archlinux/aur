# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: ARKye03 <rafa03-dev@proton.me>

pkgname=lumen
pkgver=2.32.0
pkgrel=1
pkgdesc="Instant AI Git Commit message, Git changes summary from the CLI (no API key required)"
url="https://github.com/jnsahaj/lumen"
license=('MIT')
arch=('x86_64' 'aarch64')
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
sha256sums=('a066e50d8f2f3484ff6566ae66746ea69badb23497d5085e8aecda4a585af027')
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
