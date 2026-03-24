# Maintainer: Mohammad Reza Karmi <m.r.karimi.j@gmail.com>

pkgname=css-inline
pkgver=0.20.0
pkgrel=1
pkgdesc="High-performance library for inlining CSS into HTML 'style' attributes"
arch=('x86_64' 'aarch64')
url="https://github.com/Stranger6667/css-inline"
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(rust git)
source=("$pkgname::git+$url#tag=rust-v$pkgver")
b2sums=('c323d24ec7d16a9d96e22834777cb1fbe427a2c79e3c14e57b78f87c81da2ec261d0dc846d748dc7e041549acdf284c869aa3e5732289580a706a1f2563a7185')

prepare() {
    cd "$pkgname/css-inline"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
}

build() {
    cd "$pkgname/css-inline"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="$CFLAGS -ffat-lto-objects"
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname/css-inline"

    export RUSTUP_TOOLCHAIN=stable
    python tests/server.py &
    local _server_pid=$!
    cargo test --frozen --release --all-features
    kill $_server_pid
}

package() {
    cd "$pkgname/css-inline"

    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" ../LICENSE
}
