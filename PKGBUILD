# Maintainer: earthintruders <<earthintruders at tutanota dot de>>
pkgname=qobuz-player-git
pkgver=v0.4.1.pre.2.r4.g5c5a7d1
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz"
arch=('x86_64')
url="https://github.com/SofusA/qobuz-player"
license=('GPL-3')
conflicts=('qobuz-player')
depends=(gstreamer)
makedepends=(cargo nodejs npm)
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
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cd qobuz-player-web
    npm install
}

build() {
    cd ${pkgname}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
    #build the web ui
    cd qobuz-player-web
    npm run build
    cd ..
    #build
    cargo build --frozen --release --all-features

  
}

package() {
    cd ${pkgname}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/qobuz-player"
}
