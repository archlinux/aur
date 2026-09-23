# Maintainer: Simon Repp <simon@fdpl.io>

arch=('aarch64' 'x86_64')
conflicts=('faircamp' 'faircamp-bin' 'faircamp-git')
depends=('ffmpeg' 'opus')
license=('AGPL3')
makedepends=('cargo' 'cmake' 'git')
options=('!lto')
pkgdesc='A static site generator for audio producers'
pkgname=faircamp-cli
pkgrel=1
pkgver=2.0.0
sha256sums=('b0601a411fe041baae4da86bab4242fc964df6229ff2335955f1d5df46f2deff')
url='https://faircamp.org'

source=("faircamp-${pkgver}.tar.gz::https://codeberg.org/simonrepp/faircamp/archive/${pkgver}.tar.gz")

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/faircamp"
    cargo build --locked --offline --package faircamp-cli --release
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/faircamp/target/release/faircamp-cli" "$pkgdir/usr/bin/faircamp"
}

prepare() {
    # cargo fetch pulls in optional dependencies that are not used in build(),
    # and which therefore have differing toolchain minimum requirements,
    # therefore we specify nightly as toolchain here.
    # See also: https://github.com/rust-lang/cargo/issues/5704
    export RUSTUP_TOOLCHAIN=nightly
    cd "$srcdir/faircamp"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
