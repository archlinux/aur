# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=atomdrift-scan
pkgver=2.11.0
pkgrel=2
pkgdesc='ML-powered malware classification using cleave static analysis'
arch=('x86_64')

license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'bzip2' 'rizin' 'innoextract')
makedepends=('cargo' 'git')
optdepends=('upx: binary analysis')
provides=('atomscan' 'ascan')
# Vendored liblzma (via xz2 -> lzma-sys) is compiled by the cc crate; makepkg's
# global -flto=auto produces GCC-LTO objects that some default linkers (lld)
# cannot consume, breaking the final link. Disable LTO for a portable build.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/atomdrift-project/scan/releases/download/v$pkgver/atomscan-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ee1ed1a799d911ba04fe58076bf43b1ea7fc410bd2e5c9e0200aaedea25e2497')

prepare() {
    cd scan
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd scan
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin atomscan
}

package() {
    cd scan
    install -Dm755 "target/release/atomscan" "$pkgdir/usr/bin/atomscan"
    # Backward-compat symlink: binary was named `ascan` before 2.3.0.
    ln -s atomscan "$pkgdir/usr/bin/ascan"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
