# Maintainer: Simon Repp <simon@fdpl.io>

arch=('aarch64' 'x86_64')
conflicts=('hyper8' 'hyper8-bin')
depends=('ffmpeg' 'rsync')
license=('AGPL3')
makedepends=('cargo' 'cmake' 'git')
options=('!lto')
pkgdesc='A static site generator for video publishing'
pkgname=hyper8-cli
pkgrel=1
pkgver=0.24.0
provides=('hyper8')
sha256sums=('88af4055f15ca9a19739e00c3e7ddd35e2dd9f916236089fea1d58b136212ed8')
url='https://simonrepp.com/hyper8'

source=("hyper8-${pkgver}.tar.gz::https://codeberg.org/simonrepp/hyper8/archive/${pkgver}.tar.gz")

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/hyper8"
    cargo build --locked --offline --package hyper8-cli --release
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/hyper8/target/release/hyper8-cli" "$pkgdir/usr/bin/hyper8"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/hyper8"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
