# Maintainer: R0GUE <go@r0gue.io>
pkgname=pop-cli
pkgver=0.12.1
pkgrel=1
pkgdesc="An all-in-one tool for Polkadot development"
arch=('x86_64' 'aarch64')
url="https://onpop.io/"
license=('GPL-3.0-only')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'clang' 'protobuf')
provides=('pop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/r0gue-io/pop-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9b59a13779fae9b4a7e63bb8d0b35e20ae1ca9dc03ead1cc01f8f9499cd4784')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen -p pop-cli --profile=production
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen -p pop-cli
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/production/pop" "$pkgdir/usr/bin/pop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
