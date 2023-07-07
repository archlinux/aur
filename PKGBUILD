# Maintainer: Lili1228 <aur at gramywpsl dot pl>
pkgname=martypc
pkgver=0.1.3
pkgrel=1
pkgdesc='An IBM PC/XT emulator written in Rust'
arch=(x86_64 aarch64)
depends=(alsa-lib libudev # explicit
gcc-libs glibc) # implicit
makedepends=(cargo)
url="https://github.com/dbalsom/${pkgname}"
license=(MIT)
install=martypc.install
source=("${pkgname}-${pkgver}.tgz::https://github.com/dbalsom/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=(5952826464a2e862363e91fcf0110e2fa92b692677de9f7ccbf00df62292e0a6cd0c1e881d291fc91a08e242f75d6c7e23f4a42e6664b7933ca5beaa31dbe11e)

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

#check() {
#    cd ${pkgname}-${pkgver}
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --release
#}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
	cp -a --no-preserve=ownership install "$pkgdir/usr/share/martypc"
}
