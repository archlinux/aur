pkgname=qobuz-player
pkgver=0.3.0
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3')
conflicts=('qobuz-player-git')
depends=(gstreamer)
makedepends=(cargo)
source=("qobuz-player-${pkgver}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${pkgver}-fix.tar.gz")
sha256sums=('0d2d8d89531ba8d7b1ddfd8afdaa61d7bd08b88f9fa5fa310ad106f2aaa07867')
options=('!lto')

prepare() {
    cd ${pkgname}-${pkgver}-fix
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    
}

build() {
    cd ${pkgname}-${pkgver}-fix
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
    cargo build --frozen --release --all-features

  
}

package() {
    cd ${pkgname}-${pkgver}-fix
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
