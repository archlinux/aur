# Maintainer: S.EE Team <dev@s.ee>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=see-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="A native GNOME desktop client for S.EE URL shortening service"
arch=('x86_64')
url="https://github.com/sdotee/desktop"
license=('MIT')
depends=('gtk4' 'libadwaita' 'cairo' 'pango' 'gdk-pixbuf2' 'glib2')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('038129604ca8311a2cb47840c35c2d680c69cf53d5b9d8125281380e2a4515da')

prepare() {
    cd "desktop-$pkgver/linux"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "desktop-$pkgver/linux"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "desktop-$pkgver/linux"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "data/ee.s.app.desktop" "$pkgdir/usr/share/applications/ee.s.app.desktop"
    install -Dm644 "data/ee.s.app.metainfo.xml" "$pkgdir/usr/share/metainfo/ee.s.app.metainfo.xml"
    install -Dm644 "data/icons/hicolor/scalable/apps/ee.s.app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ee.s.app.svg"
    install -Dm644 "data/ee.s.app.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/ee.s.app.gschema.xml"
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

