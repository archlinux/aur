# Maintainer: Simon Repp <simon@fdpl.io>

arch=('aarch64' 'x86_64')
conflicts=('faircamp' 'faircamp-bin' 'faircamp-cli')
depends=('ffmpeg' 'opus')
license=('AGPL3')
makedepends=('cargo' 'cmake' 'git')
options=('!lto')
pkgdesc='A static site generator for audio producers'
pkgname=faircamp-git
pkgrel=1
pkgver=r529.369d9c6
provides=('faircamp')
url='https://faircamp.org'

sha256sums=(
    '0986ca68182526ce56ea1474823cd5f057ff41720bf95cd43d724147a30a4bc6'
    'SKIP'
)

source=(
  faircamp.desktop
  'faircamp-git::git+https://codeberg.org/simonrepp/faircamp.git'
)

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname"
    cargo build --locked --offline --package faircamp --release
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/faircamp.desktop" "$pkgdir/usr/share/applications/faircamp.desktop"

    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname/target/release/faircamp" "$pkgdir/usr/bin/faircamp"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # cargo fetch pulls in optional dependencies that are not used in build(),
    # and which therefore have differing toolchain minimum requirements,
    # therefore we specify nightly as toolchain here.
    # See also: https://github.com/rust-lang/cargo/issues/5704
    export RUSTUP_TOOLCHAIN=nightly
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
