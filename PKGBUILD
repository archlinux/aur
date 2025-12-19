pkgname=qobuz-player
pkgver=0.4.4_2
_release_version="0.4.4-2"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3')
conflicts=('qobuz-player-git')
depends=(alsa-lib)
makedepends=(cargo nodejs npm alsa-lib)
source=("qobuz-player-${pkgver}.tar.gz::https://github.com/SofusA/qobuz-player/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('324d1c811be62578d68464ba412e32a5598e9bdf527a7caca491c61efbb3a704')
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
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
    #Build the webUI (thanks to moystard)
    cd qobuz-player-web
    npm run build
    cd ..
    cargo build --frozen --release --all-features

}

package() {
    cd ${pkgname}-${_release_version}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
