# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cargo-c-git
pkgver=0.9.15.r0.g4c500de
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries (git version)'
arch=('x86_64')
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=('curl' 'zlib')
makedepends=('git' 'rust' 'openssl')
provides=('cargo-c')
conflicts=('cargo-c')
source=('git+https://github.com/lu-zero/cargo-c.git')
sha256sums=('SKIP')

prepare() {
    cargo fetch --manifest-path='cargo-c/Cargo.toml'
}

pkgver() {
    git -C cargo-c describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='cargo-c/target'
    cargo build --release --frozen --all-features --manifest-path='cargo-c/Cargo.toml'
}

check() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='cargo-c/target'
    cargo test --frozen --all-features --manifest-path='cargo-c/Cargo.toml'
}

package() {
    find cargo-c/target/release -maxdepth 1 -type f -executable -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    install -D -m644 cargo-c/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
