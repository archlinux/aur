# Maintainer: waveplate <dissahc@pm.me>
pkgname=img2irc
pkgver=1.0.4
pkgrel=2
pkgdesc="CLI utility to convert images to halfblock ANSI or IRC art with various optional post-processing filters"
arch=('x86_64')
url="https://github.com/waveplate/img2irc"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/waveplate/img2irc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('133a3c80de418170975f7adba0c1c4aa8a0577e607e96ef9864c50d7740559e3')
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
