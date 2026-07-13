# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=atomdrift-scan
pkgver=2.3.0
pkgrel=1
pkgdesc='ML-powered malware classification using cleave static analysis'
arch=('x86_64')
url='https://codeberg.org/atomdrift/scan'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'bzip2' 'rizin' 'innoextract')
makedepends=('cargo' 'git')
optdepends=('upx: binary analysis')
provides=('ascan')
# Vendored liblzma (via xz2 -> lzma-sys) is compiled by the cc crate; makepkg's
# global -flto=auto produces GCC-LTO objects that some default linkers (lld)
# cannot consume, breaking the final link. Disable LTO for a portable build.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1605b7ad963a7ea64cf75172a622925c11ab794dbf4bfdba4dedd97487172ce')

prepare() {
    cd scan
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd scan
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin ascan
}

package() {
    cd scan
    install -Dm755 "target/release/ascan" "$pkgdir/usr/bin/ascan"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
