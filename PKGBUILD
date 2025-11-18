# Maintainer: William Whittaker <william@mailliw.org>

pkgname=cargo-cntp-bundle-git
pkgver=95111ca
pkgrel=1
pkgdesc="Bundle tool from the Contemporary project"
arch=(x86_64 aarch64)
url="https://github.com/hummingbird-player/hummingbird"
license=(Apache-2.0)
groups=()
depends=(
         curl libcurl.so
         fontconfig
         desktop-file-utils
         openssl libcrypto.so libssl.so
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         zlib libz.so
         zstd libzstd.so)
makedepends=(
             cargo
             cmake
             rust
             git)
options=(!debug)
source=("git+https://github.com/vicr123/contemporary-rs")
sha256sums=(SKIP)
provides=(cargo-cntp-bundle)

prepare() {
	cd "$srcdir/contemporary-rs/deploy_tool/cargo_cntp_bundle"
	cargo fetch --locked
}

build() {
    cd "$srcdir/contemporary-rs/deploy_tool/cargo_cntp_bundle"
	CFLAGS+=' -ffat-lto-objects'
	CXXFLAGS+=' -ffat-lto-objects'
    cargo build --release --locked
}

package() {
    cd "$srcdir/contemporary-rs/"
    install -Dm755 target/release/cargo-cntp-bundle "${pkgdir}/usr/bin/cargo-cntp-bundle"
}

pkgver() {
    cd "$srcdir/contemporary-rs"
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
