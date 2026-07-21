pkgname=rutile
pkgver=0.2.1
pkgrel=1
pkgdesc='GNOME-native terminal emulator with split tiling and synchronized input'
url='https://github.com/yatoub/Rutile'
license=('MIT')
makedepends=('cargo')
depends=('gtk4' 'libadwaita' 'vte4')
arch=('x86_64' 'aarch64')
source=("https://github.com/yatoub/Rutile/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(e7bd8aff091f069c945cdb496fa96f8fc0c7446f01f2f272fbe9ed85a510c8b129898350af6b93c6616b9bb37d3fd23d1cf37a4029c5936a6ea9497b2e36484a)

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
