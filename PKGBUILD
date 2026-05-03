pkgname=qobine
pkgver="2026.05.03"
_release_version="2026-05-03-1"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz. Formaly known as qobuz-player"
arch=('x86_64')
url="https://github.com/SofusA/qobine"
license=('GPL-3.0')
replaces=('qobuz-player')
conflicts=('qobine-git')
depends=(alsa-lib)
makedepends=(protobuf cargo nodejs npm)
optdepends=('ttf-font-nerd: glyph support')
source=("qobine-${_release_version}.tar.gz::https://github.com/SofusA/qobine/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('2b09e7952779e4c244bbd714a89b3a72f7d48d1c040cd6b3b1449f2a51073cbc')
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/qobuz-player"
}
