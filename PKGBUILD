pkgname=tquic-git
pkgver=1.6.0.r13.gb62863a
pkgrel=1
pkgdesc='A high-performance, lightweight, and cross-platform QUIC library'
arch=(x86_64)
url='https://github.com/Tencent/tquic'
license=(Apache-2.0)
depends=(
    gcc-libs
    glibc
)
makedepends=(
    cargo
    cmake
    git
)
options=('!buildflags' 'staticlibs')
provides=(tquic)
conflicts=(tquic)
source=("git+${url}.git"
        "git+https://github.com/google/boringssl.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
    cd tquic
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd tquic
    git submodule init
    git config submodule.src/third_party/boringssl.url "$srcdir/boringssl"
    git -c protocol.file.allow=always submodule update

    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd tquic
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd tquic
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd tquic
    install -Dm0644 -t "$pkgdir/usr/include/" include/tquic.h include/tquic_def.h
    install -Dm0644 -t "$pkgdir/usr/lib/" "target/release/libtquic.a"
    install -Dm0644 -t "$pkgdir/usr/lib/" "target/release/libtquic.so"
}
