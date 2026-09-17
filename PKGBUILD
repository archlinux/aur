# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=atomdrift-scan
pkgver=2.11.0
pkgrel=3
pkgdesc='ML-powered malware classification using cleave static analysis'
arch=('x86_64')
url='https://github.com/atomdrift-project/scan'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'bzip2' 'rizin' 'innoextract')
makedepends=('cargo' 'git')
optdepends=('upx: binary analysis')
provides=('atomscan' 'ascan')
# Vendored liblzma (via xz2 -> lzma-sys) is compiled by the cc crate; makepkg's
# global -flto=auto produces GCC-LTO objects that some default linkers (lld)
# cannot consume, breaking the final link. Disable LTO for a portable build.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a1e9c0558eea1a8042db4757e8ac1eedbeb15c7299476bfe12ce7750f3f8d9f1')

prepare() {
    cd "scan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "scan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin atomscan
}

package() {
    cd "scan-$pkgver"
    install -Dm755 "target/release/atomscan" "$pkgdir/usr/bin/atomscan"
    # Backward-compat symlink: binary was named `ascan` before 2.3.0.
    ln -s atomscan "$pkgdir/usr/bin/ascan"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
