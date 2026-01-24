pkgname=qobuz-player
pkgver="0.6.5"
_release_version="0.6.5"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3.0')
conflicts=('qobuz-player-git')
depends=(alsa-lib)
makedepends=(cargo nodejs npm)
optdepends=('ttf-font-nerd: glyph support') 
source=("qobuz-player-${pkgver}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('0bc3494bc8cad586ca9247c45dd742a0bd44df1302725033e754d8bc961a090d')
options=('!lto')

prepare() {
    cd ${pkgname}-${_release_version}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
     cd qobuz-player-web
    npm install
}

build() {
    cd ${pkgname}-${_release_version}
    #Build the webUI (thanks to moystard)
    cd qobuz-player-web
    npm run build
    cd ..
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

}

package() {
    cd ${pkgname}-${_release_version}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
