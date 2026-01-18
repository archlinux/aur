# Maintainer: Simon Repp <simon@fdpl.io>

pkgname=faircamp-git
pkgver=r529.369d9c6
pkgrel=1
pkgdesc='A static site generator for audio producers'
arch=('x86_64')
license=('AGPL3')
depends=('ffmpeg' 'opus')
makedepends=('cargo' 'cmake' 'git')
url='https://simonrepp.com/faircamp'
conflicts=('faircamp')
provides=('faircamp')
options=('!lto')
source=('faircamp-git::git+https://codeberg.org/simonrepp/faircamp.git')
md5sums=('SKIP')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname"
    cargo build --locked --offline --package faircamp --release
}

package() {
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
