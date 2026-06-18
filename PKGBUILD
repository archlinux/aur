# Maintainer: Plague-doctor <plague <at> privacyrequired <dot> com>
pkgname=ntpdiag
pkgver=1.0.0
pkgrel=1
pkgdesc="NTP diagnostic utility — query a server or inspect the local clock"
arch=('x86_64')
url="https://gitlab.com/Plague_Doctor/ntpdiag"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# The release profile strips symbols, so a -debug split package would be empty.
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('85af1a0ca94704c035e71b881e99a0117cd76d6713a224af0784e6c0d6a622b0')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
