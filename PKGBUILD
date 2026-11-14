# Maintainer: Hiroyuki Ikegami <ikegam@pplc.co>
# Version and checksum are filled in by packaging/update.sh on release.
pkgname=plamo-trans
pkgver=0.1.0
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
sha256sums=('7277d2afac442705c797ded9226f5dff5a034b5e5f74d75f43999182572105c7')

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
