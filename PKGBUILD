# Maintainer: getzze <getzze at gmail dot com>

pkgname=rgx-cli
pkgver=0.12.1
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
sha512sums=('b8d2f8389a0295ca50700a1847d7995822810723de657a3aa932541ab4923880fa7acd844d00814fde4ace6f22d467191899b3859985eda4308292f7cf57656b')

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
