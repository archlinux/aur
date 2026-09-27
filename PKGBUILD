# Maintainer: Valentin Lukyanets <valikluks95@gmail.com>
pkgname=ampered
pkgver=0.2.0
pkgrel=1
pkgdesc="Power management daemon for Linux laptops under Wayland"
arch=('x86_64')
url="https://github.com/vlukyanets/ampered"
license=('Unlicense')
depends=('gcc-libs' 'glibc' 'systemd')
makedepends=('cargo')
backup=('etc/ampered/ampered.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('78575605ae40c6acf8ba1ac33b21d3362915bcc7d02c19737c36c5f66ec8fa3b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    sed -i 's|/usr/local/bin/|/usr/bin/|g' contrib/*.service
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
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/ampered target/release/amperedctl -t "$pkgdir/usr/bin/"
    install -Dm644 examples/ampered.toml -t "$pkgdir/etc/ampered/"
    install -Dm644 contrib/ampered.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 contrib/90-ampered-backlight.rules -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
