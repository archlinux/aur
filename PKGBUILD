pkgname=qobuz-player
pkgver=0.3.1.2
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3')
conflicts=('qobuz-player-git')
depends=(gstreamer)
makedepends=(cargo)
source=("qobuz-player-${pkgver}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92717d2aebae215d1099920c1581946faae5acca400612d4115026378efbf945')
options=('!lto')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
    cargo build --frozen --release --all-features

  
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
