# Maintainer: thongor77 <magetriste@proton.me>
pkgname=kformat
pkgver=0.1.1
pkgrel=1
pkgdesc="Format disks, SSDs and USB sticks simply and safely (Rust + Kirigami + udisks2)"
arch=('x86_64')
url="https://github.com/thongor77/kformat"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'kirigami' 'udisks2' 'polkit')
makedepends=('cargo')
optdepends=('exfatprogs: format as exFAT'
            'ntfs-3g: format as NTFS'
            'f2fs-tools: format as F2FS'
            'xfsprogs: format as XFS'
            'btrfs-progs: format as Btrfs'
            'dosfstools: format as FAT32'
            'e2fsprogs: format as ext4'
            'plasma-workspace: "Format with kformat…" action in the device notifier')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a8681533010b057e2e26daca4a1de9606f48d8d11f9789107121ed95ff5ccfd')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    # Keep the build directory out of the binary (generated C++ headers and Rust paths).
    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir=/build"
    export CFLAGS="$CFLAGS -ffile-prefix-map=$srcdir=/build"
    export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/build"
    cargo build --frozen --release -p kformat-app
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    # Unit tests only: the udisks integration tests are #[ignore]d (they need a
    # system bus and create loop devices, so they cannot run in a build chroot).
    cargo test --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/kformat-app "$pkgdir/usr/bin/kformat"
    install -Dm644 packaging/icons/hicolor/scalable/apps/kformat.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/kformat.svg"
    install -Dm644 packaging/kformat.desktop "$pkgdir/usr/share/applications/kformat.desktop"
    install -Dm644 packaging/solid/kformat-format.desktop \
        "$pkgdir/usr/share/solid/actions/kformat-format.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
