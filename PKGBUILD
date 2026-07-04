# Maintainer: Bryson Kelly <bryson@azin-lang.org>
pkgname=buf-cli
_binname=buf
pkgver=0.2.0
pkgrel=1
_srcdir="buf-$pkgver"
pkgdesc="A fast, safe bootable USB image flasher"
arch=('x86_64' 'aarch64')
url="https://github.com/brysonak/buf"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
optdepends=('ntfs-3g: NTFS fallback for ISOs that disrespect the FAT32 4GB limit for individual files')
source=("buf-$pkgver.tar.gz::https://github.com/brysonak/buf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('674dd12197a52b0571593cd1916b849334e5a472e4e589a61863586e8738ed57')

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --package buf
}

check() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked --package buf
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "docs/docs.md" "$pkgdir/usr/share/doc/$pkgname/docs.md"
}
