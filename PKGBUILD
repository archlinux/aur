# Maintainer: Nasir A. <NasirA1991@users.noreply.github.com>
# Template consumed by .github/workflows/release.yml; 2.2.0 and 9afc5634d57e9f92a6efa4cd4f8b3a651f9aab89536b954bcd0783fe407d92c5
# are filled in only for the generated AUR package.
pkgname=gsp370-tray
pkgver=2.2.0
pkgrel=1
pkgdesc='Tray and Plasma widget for the Sennheiser/EPOS GSP 370 (battery and sidetone)'
arch=('x86_64' 'aarch64')
url='https://github.com/NasirA1991/gsp370-tray'
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('rust')
optdepends=('libnotify: low-battery notifications'
            'plasma-workspace: KDE Plasma panel widget')
options=('!debug')
install=gsp370-tray.install
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('9afc5634d57e9f92a6efa4cd4f8b3a651f9aab89536b954bcd0783fe407d92c5')

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
    install -d "$pkgdir/usr/share/plasma/plasmoids/org.nasir.gsp370battery"
    cp -a packaging/plasmoid/gsp370battery/. \
        "$pkgdir/usr/share/plasma/plasmoids/org.nasir.gsp370battery/"
}
