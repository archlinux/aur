pkgname=qobuz-player
pkgver=0.5.1
_release_version="0.5.1"
pkgrel=2
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3')
conflicts=('qobuz-player-git')
depends=(alsa-lib)
makedepends=(cargo nodejs npm)
optdepends=('ttf-font-nerd: glyph support') 
source=("qobuz-player-${pkgver}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('a9e67f6bbd69b3f5221cf25a7e3aaae59082be3b3d383e939939b16c881a0e88')
options=('!lto')

prepare() {
    cd ${pkgname}-${_release_version}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
