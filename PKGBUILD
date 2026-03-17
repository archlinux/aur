# Maintainer: getzze <getzze at gmail dot com>

pkgname=rgx-cli
pkgver=0.7.0
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
sha512sums=('a6feb12a825f646b6ddca4cad9feb3d08b5b1d69e9ab28d2fb163ea761c3936c1c9acb22ffebe1f7f2b334e0190ab303584b0477c22cdab3797d540f24b154df')

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
