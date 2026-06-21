# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kimiblock Moe

pkgname=clash-rs
pkgver=0.10.7
pkgrel=1
pkgdesc="custom protocol network proxy"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/Watfaq/clash-rs"
license=(Apache-2.0)
depends=(libgcc libzstd.so)
makedepends=(cargo)
options=(!lto)
backup=(etc/clash-rs/config.yaml)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        clash-rs.service
        clash-rs@.service
        config.yaml)
sha256sums=('d2e6a0e3ebde677e66757acf59f3c55c2a20de805cb8be4c7c14f574cec1044b'
            '64c1b08fe40af101b5a113212e28aec7e91f63424bec85d50efc5b0fc9ce62ce'
            'c1629d3f5b48053616141076ad8d21031fbca84a352b123d9e3c5bad6406f4a7'
            'd6f1782c0a57591ef6b8c4c898fc7a883363ec45742ae41eee8b91eb68d90f05')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    ## TODO: get upstream to sync their Cargo.lock
    cargo update
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --release --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/clash-rs -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$srcdir/config.yaml" -t "$pkdgir/etc/clash-rs/"
    install -Dm644 clash-rs{,@}.service -t "$pkgdir/usr/lib/systemd/system/"
}
