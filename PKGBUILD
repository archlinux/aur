# Maintainer: Bryson Kelly <brysonak@protonmail (dot) com>
pkgname=bufusb-cli
_binname=bufusb
pkgver=0.2.6
pkgrel=1
_srcdir="bufusb-$pkgver"
pkgdesc="A fast, safe bootable USB image flasher"
arch=('x86_64' 'aarch64')
url="https://github.com/brysonak/bufusb"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('ntfs-3g: NTFS fallback for ISOs with files over the FAT32 4 GiB limit')
replaces=('buf-cli')
conflicts=('buf-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brysonak/bufusb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aaf4ca6fc241a62f5d70ed7e92eee1b03e5b62edf69654fe2a3a3cc8747e0a2a')

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p bufusb
}

check() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/docs.md "$pkgdir/usr/share/doc/$pkgname/docs.md"
}
