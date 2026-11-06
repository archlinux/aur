pkgname=rutile
pkgver=0.9.0
pkgrel=1
pkgdesc='GNOME-native terminal emulator with split tiling and synchronized input'
url='https://github.com/yatoub/Rutile'
license=('MIT')
makedepends=('cargo')
depends=('gtk4' 'libadwaita' 'vte4')
arch=('x86_64' 'aarch64')
source=("https://github.com/yatoub/Rutile/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(f1b2776be45394aa0409322881d7cf4c2c2385d0836106e3eadf68fc37d4cd46efe9a29c006b25b0b30b7174fd3000aef8061340f665b6daf225ef3c1093ce72)

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
