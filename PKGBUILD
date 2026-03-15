pkgname=qobuz-player
pkgver="0.7.4"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3.0')
conflicts=('qobuz-player-git')
depends=(alsa-lib)
makedepends=(protobuf cargo nodejs npm)
optdepends=('ttf-font-nerd: glyph support') 
source=("qobuz-player-${pkgver}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db3a9e18eb49de93ae88e8be1eeab80c57aa398c602cb8cb2e34d0aa02860d78')
options=('!lto')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
    cd qobuz-player-web
    npm install
}

build() {
    cd ${pkgname}-${pkgver}
    #Build the webUI (thanks to moystard)
    cd qobuz-player-web
    npm run build
    cd ..
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
