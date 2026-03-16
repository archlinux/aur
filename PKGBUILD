# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=dumbpipe
pkgver=0.35.0
pkgrel=1
pkgdesc="Connect A to B. Send Data."
arch=('x86_64')
url="https://github.com/n0-computer/dumbpipe"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('aafe6c563bf5c19fad48d31a524b0ff45c6bbf880c271677b5b62f1ec388dbc127df152576bfe4dbc47a62809d1cb3324b3d9112a1e0f1e1e17720b16684d622')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    echo >&2 'Packaging the executable'
    install -D -m 755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"

    echo >&2 'Packaging the documentation'
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

    echo >&2 'Packaging the license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE-MIT'
}
