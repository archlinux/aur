# Maintainer: waveplate <dissahc@pm.me>
pkgname=img2irc
pkgver=1.3.0
pkgrel=1
pkgdesc="a highly versatile image to IRC/ANSI art converter"
arch=('x86_64')
url="https://github.com/waveplate/img2irc"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/waveplate/img2irc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6af58755a1a270eb320188b41f16a2d9a4e0893f544c5624e511e397ef08f7d5')
options=('!strip' '!debug')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --offline --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}
