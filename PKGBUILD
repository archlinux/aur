# Maintainer: kabuspl <jakubs832 at gmail dot com>

pkgname=trayplay
pkgver=2.0.0
pkgrel=1
pkgdesc="Instant Replay (DVR) app for KDE using gpu-screen-recorder in the background"
arch=('x86_64' 'aarch64')
url="https://github.com/kabuspl/trayplay"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'gpu-screen-recorder' 'xdg-desktop-portal-impl' 'kirigami' 'ki18n' 'kcoreaddons')
makedepends=('cargo' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kabuspl/trayplay/archive/v${pkgver}.tar.gz")
sha256sums=('71378140147e106099b2f3e8b6a78602292e3e16cf0ba99013c92fd87244948a')

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
    install -Dm0644 -t "$pkgdir/usr/share/applications" "dist/ovh.kabus.TrayPlay.desktop"
    install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" "dist/ovh.kabus.TrayPlay.svg"
    install -Dm0644 -t "$pkgdir/usr/share/metainfo" dist/ovh.kabus.TrayPlay.metainfo.xml
    find locale -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/{}" \;
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
