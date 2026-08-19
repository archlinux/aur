pkgname=rutile
pkgver=0.6.3
pkgrel=1
pkgdesc='GNOME-native terminal emulator with split tiling and synchronized input'
url='https://github.com/yatoub/Rutile'
license=('MIT')
makedepends=('cargo')
depends=('gtk4' 'libadwaita' 'vte4')
arch=('x86_64' 'aarch64')
source=("https://github.com/yatoub/Rutile/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(e07732259d3aa985f17bc9e917a5d84740e95e2389ef0cecfa169efbdda4f57b2b653c0351daaa10b2cda1e398f6cbb5cdbd10c01dfa3b26d545a9e9a6e860e4)

prepare() {
    cd Rutile-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed 's/host: //;t;d')"
}

build() {
    cd Rutile-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd Rutile-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd Rutile-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 resources/rutile.desktop "$pkgdir/usr/share/applications/rutile.desktop"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
