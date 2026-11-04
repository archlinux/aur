# Maintainer: Nasir A. <NasirA1991@users.noreply.github.com>
pkgname=gsp370-tray
pkgver=2.0.0
pkgrel=1
pkgdesc='Tiny StatusNotifierItem tray for the Sennheiser/EPOS GSP 370 (battery and sidetone)'
arch=('x86_64' 'aarch64')
url='https://github.com/NasirA1991/gsp370-tray'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
optdepends=('libnotify: low-battery notifications')
options=('!debug')
install=gsp370-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2cd98e3e84221b6f90b4dd5e4f51b13445549e95cba77143837b55f8b16ff7ef')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    cargo build --release --locked --manifest-path rust/Cargo.toml
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    cargo test --release --locked --manifest-path rust/Cargo.toml
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 rust/target/release/gsp370-tray "$pkgdir/usr/bin/gsp370-tray"
    install -Dm644 packaging/gsp370-tray.desktop \
        "$pkgdir/usr/share/applications/gsp370-tray.desktop"
    install -Dm644 packaging/gsp370-tray.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/gsp370-tray.svg"
    install -Dm644 packaging/70-gsp370.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-gsp370.rules"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/protocol.md "$pkgdir/usr/share/doc/$pkgname/docs/protocol.md"
    install -Dm644 docs/tray-icon.png "$pkgdir/usr/share/doc/$pkgname/docs/tray-icon.png"
}
