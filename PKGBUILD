# Maintainer: Hiroyuki Ikegami <ikegam@pplc.co>
# Version and checksum are filled in by packaging/update.sh on release.
pkgname=plamo-trans
pkgver=0.1.1
pkgrel=1
pkgdesc="Local translation as a Unix filter: PLaMo 3 Translate on llama.cpp, no server"
arch=('x86_64' 'aarch64')
url="https://github.com/ikegam/plamo-trans"
license=('BSD-4-Clause' 'MIT')
depends=('gcc-libs' 'glibc' 'curl')
makedepends=('cargo' 'cmake')
conflicts=('trs-git')
# the static llama.cpp libraries are linked by rustc, which does not pass -flto
options=('!lto')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e8a6102857b4b1b124bd981607151a8217d0f4461729f08f24877fcdbe41e383')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # the release tarball includes the patched llama.cpp sources (no download here);
    # llama.cpp is built for this machine's CPU (GGML_NATIVE)
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/trs "$pkgdir/usr/bin/trs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 llama.cpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.llama.cpp"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
