# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=purrcrypt
pkgver=r15.793d83a
pkgrel=1
pkgdesc='A fur-ociously secure encryption tool that encodes your secrets as adorable cat and dog sounds, using real elliptic curve cryptography with a playful disguise'
arch=('x86_64')
url="https://github.com/vxfemboy/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=('purr')
conflicts=('purr')
source=("$pkgname-$pkgver::git+$url.git#commit=793d83a")
b2sums=('d24a1aea5a746cc7e5635c1a951af673b9116f263f9d0721c998ed615a47e43c6acef55b97e67c73806ec36567553a5b7b389598dbb3b79aba90ad8cbbd5f255')

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
