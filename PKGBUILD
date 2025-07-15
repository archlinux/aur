# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=purrcrypt
pkgver=r7.116f168
pkgrel=4
pkgdesc='A fur-ociously secure encryption tool that encodes your secrets as adorable cat and dog sounds, using real elliptic curve cryptography with a playful disguise'
arch=('x86_64')
url="https://github.com/vxfemboy/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=('purr')
conflicts=('purr')
source=("$pkgname-$pkgver::git+$url.git#commit=116f168")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname-$pkgver
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
    install -Dm755 target/release/purr "$pkgdir/usr/bin/purr"
    install -Dm644 $pkgname-demo.gif "$pkgdir/usr/share/doc/$pkgname/demo.gif"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
