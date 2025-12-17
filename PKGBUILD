# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=rusticon-git
_name=${pkgname%-git}
pkgver=0.2.3.r1.ge2ece1a
pkgrel=1
pkgdesc='A mouse driven SVG favicon editor for your terminal'
arch=('armv7h' 'aarch64' 'i686' 'riscv64' 'x86_64')
url="https://github.com/ronilan/$_name"
license=('CC-BY-NC-ND-4.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_name
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd $_name
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

check() {
    cd $_name
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $_name
    install -Dm755 target/release/$_name "$pkgdir/usr/bin/$_name"
}
