# Maintainer: Milhan Hadjadji <xmoncocox@gmail.com>
pkgname=palemachine
pkgver=0.1.2
pkgrel=2
pkgdesc="a youtube downloader for servers"
arch=('x86_64')
url="https://github.com/Xmoncoco/palemachine"
license=('MIT')
depends=('gcc-libs' 'sqlite' 'python' 'openssl' 'ffmpeg' 'yt-dlp' 'zstd')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "palemachine.service"
        "palemachine.sysusers"
        "palemachine.tmpfiles")
sha256sums=('997d14e2e789c7bbc8474a00989794c36f893be1c7f5f0d52a631ebe2fd40c47'
            '2c06540f3c60c44c858930d67ac22dfbef1a0ed4eb55044246f79f89d3e35fef'
            '400e42fc588f97abb5dafd90440dcd6066091c891aaad506b9235859af6826f9'
            '1c48f8dfa298a2224f09e9c8c5240f54162d2a7eecf7540221e2bb2f0303b7fb')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install everything to /opt/palemachine to preserve relative paths
    install -d "$pkgdir/opt/$pkgname"
    
    # Copy the binary
    install -Dm755 "target/release/palemachine" "$pkgdir/opt/$pkgname/palemachine"
    
    # Copy assets
    cp -r pages "$pkgdir/opt/$pkgname/"
    install -Dm755 "downloader" "$pkgdir/opt/$pkgname/downloader"
    install -Dm644 "requirement.txt" "$pkgdir/opt/$pkgname/requirement.txt"
    install -Dm644 ".version" "$pkgdir/opt/$pkgname/.version"
    install -Dm755 "bambam_morigatsu_chuapo.sh" "$pkgdir/opt/$pkgname/bambam_morigatsu_chuapo.sh"
    install -Dm755 "update.sh" "$pkgdir/opt/$pkgname/update.sh"

    # Create a wrapper script in /usr/bin
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
cd /opt/$pkgname
exec ./palemachine "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Install systemd service and configuration
    cd "$srcdir"
    install -Dm644 "palemachine.service" "$pkgdir/usr/lib/systemd/system/palemachine.service"
    install -Dm644 "palemachine.sysusers" "$pkgdir/usr/lib/sysusers.d/palemachine.conf"
    install -Dm644 "palemachine.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/palemachine.conf"
}
