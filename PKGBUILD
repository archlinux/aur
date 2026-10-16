# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=atomdrift-scan
pkgver=2.12.1
pkgrel=1
pkgdesc='ML-powered malware classification using cleave static analysis'
arch=('x86_64')
url='https://github.com/atomdrift-project/scan'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'bzip2' 'rizin' 'innoextract')
makedepends=('cargo' 'cmake' 'git')
optdepends=('upx: binary analysis')
provides=('atomscan' 'ascan')
# Vendored liblzma (via xz2 -> lzma-sys) is compiled by the cc crate; makepkg's
# global -flto=auto produces GCC-LTO objects that some default linkers (lld)
# cannot consume, breaking the final link. Disable LTO for a portable build.
options=('!lto')
# TEMP: am-fs-squashfs 0.1.5 (locked via cleave) was removed from crates.io, see
# https://github.com/atomdrift-project/scan/issues/13. Build it from its git tag
# instead; drop this source and the patch in prepare() once a fixed release ships.
_sqfs=0.1.5
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "am-fs-squashfs-$_sqfs.tar.gz::https://github.com/antimatter-studios/rust-fs-squashfs/archive/v$_sqfs.tar.gz")
sha256sums=('b0394c2fac20295e1ee2d8221e485690809ad27a95a430f265922b80962a9325'
            '9e32409d2d9545911ea667331ba7cc89b7e0dff9653a92b2c6ea448e5831f2c9')

prepare() {
    # TEMP (scan#13): the tag points am-fs-core at a sibling checkout; use crates.io.
    sed -i 's|path = "../rust-fs-core", ||' "rust-fs-squashfs-$_sqfs/Cargo.toml"
    cd "scan-$pkgver"
    sed -i "/^\[patch.crates-io\]/a am-fs-squashfs = { path = \"$srcdir/rust-fs-squashfs-$_sqfs\" }" Cargo.toml
    export RUSTUP_TOOLCHAIN=stable
    # Not --locked: the patch rewrites the am-fs-squashfs lock entry (registry -> path).
    cargo update -p am-fs-squashfs
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "scan-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # aws-lc-sys's cc builder lets makepkg's -O2/-O3 override the -O0 that
    # jitterentropy requires (#error); its CMake builder orders the flags correctly.
    export AWS_LC_SYS_CMAKE_BUILDER=1
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
