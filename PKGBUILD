pkgname=selfsync
pkgver=0.1.7
pkgrel=1
pkgdesc="Self-hosted Chrome Sync server."
arch=(x86_64)
url=https://github.com/loyalpartner/selfsync
license=(GPL-3.0-or-later)
depends=(glibc libgcc sqlite)
makedepends=(cargo protobuf)
source=("$pkgname-$pkgver.tar.gz::https://github.com/loyalpartner/selfsync/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname-user.service")
sha256sums=('e7bdf34bc81c438c6fc6b75669c1249471a5a2d49ea546d0222c456942c2218b'
            '5011a12b92faf53af85ff81dea14383579b6f247b0ba8dcb59617c7e02b9049c'
            '1329f53ab77afa9168890f3530f1d76e4765c65a1f4584a168263b3b2dff7ea5')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}
build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=true
    cargo build --frozen --release --all-features
}
check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=true
    cargo test --frozen --all-features
}
package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname-server" "$pkgdir/usr/bin/$pkgname-server"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname-user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
