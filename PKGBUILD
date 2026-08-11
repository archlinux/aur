# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=dumbpipe
pkgver=0.39.0
pkgrel=1
pkgdesc="Connect A to B. Send Data."
arch=('x86_64')
url="https://github.com/n0-computer/dumbpipe"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('eb8218f9beace11fa3fbfc2f7dff6f67049a90597d29d366ff9a157de0d58b0486126dd04e671740fb1ed301f8ff161865de0ebd48117dde7e18aa5f20847f76')

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
