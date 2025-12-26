# Maintainer: earthintruders <<earthintruders at tutanota dot de>>
pkgname=qobuz-player-git
pkgver=v0.4.5.r6.g889c61b
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3')
conflicts=('qobuz-player')
depends=(alsa-lib)
makedepends=(git cargo nodejs npm)
source=("qobuz-player-git::git+https://github.com/SofusA/qobuz-player.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd qobuz-player-web
}

prepare() {
    cd ${pkgname}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
    cd qobuz-player-web
    npm install
}

build() {
    cd ${pkgname}
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
    cd ${pkgname}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/qobuz-player"
}
