# Maintainer: kabuspl <jakubs832 at gmail dot com>

pkgname=trayplay
pkgver=0.2.0
pkgrel=1
pkgdesc="Instant Replay (DVR) app for KDE using gpu-screen-recorder in the background"
arch=('x86_64' 'aarch64')
url="https://github.com/kabuspl/trayplay"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gpu-screen-recorder' 'xdg-desktop-portal-impl' 'kdialog')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kabuspl/trayplay/archive/v${pkgver}.tar.gz")
sha256sums=('83d2009c6c493af3b37a7bbac75f7b38be083e728e3cfe18dfd81268a17822fc')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

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
