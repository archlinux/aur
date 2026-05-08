# Maintainer: Naqua Darazaki <n.darazaki@gmail.com>
pkgname=clockode
pkgver=0.2.5
pkgrel=1
pkgdesc="TOTP client made with Iced"
arch=('x86_64' 'aarch64')
url="https://github.com/mariinkys/clockode"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "autofocus-password-field.patch")
conflicts=()
b2sums=('c6e5f7a4ed7dbd899c8d94b95cb7eff32d46bacc679af2ce9b6712245291ef094a5a13190c0687e3bdb05a354ebf9c7c45e9d42e82a0380e2f826bd7e6c63998'
        '896822a7540c1d4550e3e0930510ea15416aad0a8ac3a78405d5072d7db41afddff6df71ffb672583d4512783b5df05179b8f0e1d07a0d759873052ad5c3553d')

cargo_do() {
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo "$@"
}

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/autofocus-password-field.patch"
    cargo_do fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"
    cargo_do build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    local appid="dev.mariinkys.Clockode"
    install -Dm755 "target/release/clockode" -t "$pkgdir/usr/bin/"
    install -Dm644 "resources/$appid.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "resources/$appid.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
    install -Dm644 "resources/icons/hicolor/scalable/apps/icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm644 "resources/icons/hicolor/256x256/apps/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$appid.png"
}
