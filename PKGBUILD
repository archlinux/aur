pkgname=qobuz-player
pkgver="0.10.1"
_release_version="0.10.1-fix-1"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3.0')
conflicts=('qobuz-player-git')
depends=(alsa-lib)
makedepends=(protobuf cargo nodejs npm)
optdepends=('ttf-font-nerd: glyph support') 
source=("qobuz-player-${_release_version}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('ac65d474df8f64e3099a4d653d3c30d4f5e8c83e8497e0110555481002173683')
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
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

}

package() {
    cd ${pkgname}-${_release_version}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
