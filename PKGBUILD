# Maintainer: kabuspl <jakubs832 at gmail dot com>

pkgname=trayplay
pkgver=1.1.0
pkgrel=1
pkgdesc="Instant Replay (DVR) app for KDE using gpu-screen-recorder in the background"
arch=('x86_64' 'aarch64')
url="https://github.com/kabuspl/trayplay"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gpu-screen-recorder' 'xdg-desktop-portal-impl' 'kdialog' 'kirigami')
makedepends=('cargo' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kabuspl/trayplay/archive/v${pkgver}.tar.gz")
sha256sums=('95da67f71d0ea66dd51f7991ce30c7dfe1635486fbe3b33c3a166e17ca6eeaf4')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CXXFLAGS+=" -fno-lto"

    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/trayplay" "dist/kwin_script.js"
    install -Dm0644 -t "$pkgdir/usr/share/applications" "dist/ovh.kabus.trayplay.desktop"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
