# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=dumbpipe
pkgver=0.34.0
pkgrel=1
pkgdesc="Connect A to B. Send Data."
arch=('x86_64')
url="https://github.com/n0-computer/dumbpipe"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('e121eea8bce86129f5a376d77025dca054074f33360e13fefd76b4c4dd1eddccac6b265c6caf9397d2c4205dfe6dae88f377b14368f416c817a4b639440fb84d')

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
