pkgname=rutile
pkgver=0.14.0
pkgrel=1
pkgdesc='GNOME-native terminal emulator with split tiling and synchronized input'
url='https://github.com/yatoub/Rutile'
license=('MIT')
makedepends=('cargo')
depends=('gtk4' 'libadwaita' 'vte4')
arch=('x86_64' 'aarch64')
source=("https://github.com/yatoub/Rutile/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(9f43842b97ef8d122307e54b61dfb071cbe595aa054c921bf8ba31b352eb29dee16e2603efa03816a3f1d7a31d60f650a21167856fc39cf718521007818bda43)

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
