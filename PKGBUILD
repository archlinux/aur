# Maintainer: VZstless <i [at] vzstless [dot] moe>

pkgname=stoolap-git
pkgver=0.4.0.r23.g7e6634b
pkgrel=1
pkgdesc="Modern Embedded SQL Database written in Rust"
arch=('x86_64')
url="https://github.com/stoolap/stoolap"
license=("Apache-2.0")
makedepends=("rust" "git")
options=('!lto')
provides=('stoolap')
conflicts=('stoolap')
source=("$pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/stoolap"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/stoolap/" "LICENSE"
}
