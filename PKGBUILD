# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cargo-c-git
pkgver=0.9.9.r0.g3273eff
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries (git version)'
arch=('x86_64')
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=('curl' 'openssl' 'zlib')
makedepends=('git' 'rust')
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
    cargo build --release --frozen --manifest-path='cargo-c/Cargo.toml'
}

check() {
    cargo test --release --frozen --manifest-path='cargo-c/Cargo.toml'
}

package() {
    cargo install --frozen --offline --no-track --path cargo-c --root "${pkgdir}/usr"
    install -D -m644 cargo-c/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
