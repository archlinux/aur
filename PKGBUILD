# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kimiblock Moe

pkgname=clash-rs
pkgver=0.10.8
pkgrel=1
pkgdesc="custom protocol network proxy"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/ibigbug/clash-rs"
license=(Apache-2.0)
depends=(libgcc zstd libzstd.so)
makedepends=(cargo npm nodejs)
options=(!lto)
backup=(etc/clash-rs/config.yaml)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        clash-rs.service
        clash-rs@.service
        config.yaml)
sha256sums=('1eea145b11df8fed17b141c9a6a24a9c0d3e197a1c60c750ed0603b4cf54ab95'
            '64c1b08fe40af101b5a113212e28aec7e91f63424bec85d50efc5b0fc9ce62ce'
            'c1629d3f5b48053616141076ad8d21031fbca84a352b123d9e3c5bad6406f4a7'
            'd6f1782c0a57591ef6b8c4c898fc7a883363ec45742ae41eee8b91eb68d90f05')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    ## TODO: get upstream to sync their Cargo.lock
    cargo fetch --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --release --frozen --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    CLASH_RS_CI=true cargo test --frozen --all --all-features -- \
        --skip "test_bad_labels_with_custom_resolver" \
        --skip "test_proxy_server_domain_resolved_via_proxy_nameserver" \
        --skip "start_and_stop"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/clash-rs -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$srcdir/config.yaml" -t "$pkgdir/etc/clash-rs/"
    install -Dm644 "$srcdir"/clash-rs{,@}.service -t "$pkgdir/usr/lib/systemd/system/"
}
