# Maintainer: getzze <getzze at gmail dot com>

pkgname=rgx-cli
pkgver=0.10.2
pkgrel=1
pkgdesc="A terminal regex tester with real-time matching and multi-engine support"
arch=('x86_64')
url="https://github.com/brevity1swos/rgx"
license=('Apache-2.0 OR MIT')
makedepends=('cargo')
depends=('pcre2' 'libgcc' 'glibc')
options=('!lto')
_binname=rgx
provides=('rgx')
conflicts=('rgx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brevity1swos/rgx/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('19636ad79481a99f5fbd09856b899610c8720909d3b681be167a4824ee3c750e6cebe625d94ba4b02737c4127ddffbb4d1b08fd05a6640dcc5e799c069bf0427')

prepare() {
    cd "$_binname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$_binname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --bin ${_binname}
}

check() {
    cd "$_binname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}


package() {
    cd "$_binname-$pkgver"

    install -Dm0755 target/release/${_binname} "$pkgdir"/usr/bin/${_binname}
    install -Dm444 LICENSE-APACHE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
    install -Dm444 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
    install -Dm444 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
