# Maintainer: Pierre Grasser <pierre.grasser@proton.me>
pkgname=save3ds_fuse-git
_reponame=${pkgname%_fuse-git}
pkgver=1.3.0.r20.gc42ef53
pkgrel=1
pkgdesc="Extract/Import/FUSE for 3DS save/extdata/database"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/wwylele/save3ds"
license=('Apache' 'MIT')
depends=('gcc-libs' 'fuse')
makedepends=('git' 'cargo' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wwylele/save3ds.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_reponame}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_reponame}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    RUSTFLAGS=--remap-path-prefix="${srcdir}"=src cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${_reponame}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE-MIT"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
