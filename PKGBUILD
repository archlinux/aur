# Maintainer: Simon Repp <simon@fdpl.io>

arch=('aarch64' 'x86_64')
conflicts=('faircamp-bin' 'faircamp-cli' 'faircamp-git')
depends=('ffmpeg' 'opus')
license=('AGPL3')
makedepends=('cargo' 'cmake' 'git')
options=('!lto')
pkgdesc='A static site generator for audio producers'
pkgname=faircamp
pkgrel=1
pkgver=2.0.1
url='https://faircamp.org'

sha256sums=(
    '0986ca68182526ce56ea1474823cd5f057ff41720bf95cd43d724147a30a4bc6'
    'c3518bb1a54609475ba7452f2e4b0fe82199818700083a0cd69d8997f59a4585'
)

source=(
  faircamp.desktop
  "faircamp-${pkgver}.tar.gz::https://codeberg.org/simonrepp/faircamp/archive/${pkgver}.tar.gz"
)

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/faircamp"
    cargo build --locked --offline --package faircamp --release
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/faircamp.desktop" "$pkgdir/usr/share/applications/faircamp.desktop"

    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/faircamp/target/release/faircamp" "$pkgdir/usr/bin/faircamp"
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
