# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=dumbpipe
pkgver=0.28.0
pkgrel=1
pkgdesc="Connect A to B. Send Data."
arch=('x86_64')
url="https://github.com/n0-computer/dumbpipe"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('04b2f8632d0f6e12315747e21078ba2a067c33824b8abed947226f4038e6ed706c9de7057b9629d9c1fbefa6f95329ca84024384ba3ac81d5722f54ae9973c27')

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
