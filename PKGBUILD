# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=muzak
pkgver=2.4.0
pkgrel=1
pkgdesc='Command-line suite for playing and compiling the bells of bezelea'
arch=(x86_64)
url='https://github.com/The0x539/muzak'
license=(unknown)
depends=(alsa-lib glibc libgcc)
makedepends=(cargo)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('d14ae89a6e3b5cda887f039a2e3373a80f6f2014cee650ad8d567c7219d9763b6132bdc106da4b4e9c110ec5097379fd31304e28de6d93fb0761222ba203304a')

prepare() {
    cd muzak-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd muzak-$pkgver

    # Fix ring crate LTO incompatibility with fat LTO objects
    export CFLAGS="${CFLAGS} -ffat-lto-objects"
    export CXXFLAGS="${CXXFLAGS} -ffat-lto-objects"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

check() {
    cd muzak-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd muzak-$pkgver
    install -Dm755 target/release/muzak -t "$pkgdir/usr/bin/"
}
