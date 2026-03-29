# Maintainer: Austin Riba <austin@m51.io>
pkgname=gelly
pkgver=1.0.0
pkgrel=1
pkgdesc="A Jellyfin media server client focused on music."
url="https://github.com/Fingel/gelly"
license=("GPL-3.0-or-later")
depends=("libadwaita")
makedepends=("cargo")
arch=("x86_64" "aarch64")
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("0cf183dce19a235c02f15169fdd05ff2f042befd0b55f591745eb63af8388f75b63361bc56b347c7fdbac71b573b963494f3a8665187bd45a3db54d1b8c68fb4")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 target/release/gelly "$pkgdir/usr/bin/gelly"
    install -Dm 0644 resources/io.m51.Gelly.desktop "$pkgdir/usr/share/applications/io.m51.Gelly.desktop"
    install -Dm 0644 resources/io.m51.Gelly.metainfo.xml "$pkgdir/usr/share/metainfo/io.m51.Gelly.metainfo.xml"
    install -Dm 0644 resources/io.m51.Gelly.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/io.m51.Gelly.gschema.xml"
    install -Dm 0644 resources/io.m51.Gelly.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.m51.Gelly.svg"
    install -Dm 0644 resources/io.m51.Gelly-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.m51.Gelly-symbolic.svg"
}
