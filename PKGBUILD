# Maintainer: waveplate <dissahc@pm.me>
pkgname=img2irc
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI utility to convert images to halfblock ANSI or IRC art with various optional post-processing filters"
arch=('x86_64')
url="https://github.com/waveplate/img2irc"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/waveplate/img2irc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec62d13d04ea71a72d6310b198fa4e3c309cd522c4035282be0696375c04bbf7')
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
