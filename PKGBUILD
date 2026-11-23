# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=amorphis
pkgver=0.2.0
pkgrel=1
pkgdesc="Screen locker and idle daemon for Wayland and X11"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/amorphis"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'pam')
makedepends=('cargo' 'pkgconf')
optdepends=('playerctl: defer idle rules during MPRIS playback')
backup=('etc/pam.d/amorphis')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'amorphis.pam')
sha256sums=('b0bdf4d1ec09b2da367fea9a1c5492783341f45de4b00265241a43fc27ab8c67'
            'b23a0ff8022f51f692b498fb3c78d467ea6575e0ccf9d42fc4172ff539116a9a')

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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/amorphis "$pkgdir/usr/bin/amorphis"
    install -Dm755 target/release/amorphis-idle "$pkgdir/usr/bin/amorphis-idle"
    local example
    for example in x11 wayland idle; do
        install -Dm644 "examples/$example.toml" "$pkgdir/usr/share/amorphis/examples/$example.toml"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/amorphis.pam" "$pkgdir/etc/pam.d/amorphis"
}
