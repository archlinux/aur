# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=purrcrypt
pkgver=r13.c9094e0
pkgrel=1
pkgdesc='A fur-ociously secure encryption tool that encodes your secrets as adorable cat and dog sounds, using real elliptic curve cryptography with a playful disguise'
arch=('x86_64')
url="https://github.com/vxfemboy/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=('purr')
conflicts=('purr')
source=("$pkgname-$pkgver::git+$url.git#commit=c9094e0")
b2sums=('644ca8693b495e1f6058c5f2b061759a973ad5f2ec79b20e8ab31bbac4e44ac11b67858d4acf922a4fa4de2f5577459b951bfb589cf4fc9bb01c575318edb2ef')

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
