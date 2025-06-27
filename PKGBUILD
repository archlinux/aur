# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# shellcheck disable=SC2034,SC2154

pkgname=yggdrasil-keygen
pkgver=0.2.1
pkgrel=1
pkgdesc="A small executable to generate yggdrasil keys and output them to stdout as a json blob."
arch=('x86_64')
url="https://github.com/famedly/yggdrasil-keygen"
license=('AGPL-3.0-only')
makedepends=('cargo')
depends=(
    'gcc-libs'
    'glibc'
)
provides=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('df4220ef470751e641a542297cab6c6c00d7800a6b4045b47c318bb53f7bf27827535b462ea1f41eee399dced19545fb04b85c740cf4d625d7e9dd22a85f28e6')

prepare() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
