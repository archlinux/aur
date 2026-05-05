# Maintainer: Austin Riba <austin@m51.io>
pkgname=gelly
pkgver=1.2.2
pkgrel=1
pkgdesc="Music player for Jellyfin and Subsonic"
url="https://github.com/Fingel/gelly"
license=("GPL-3.0-or-later")
depends=("libadwaita" "gst-plugins-good" "org.freedesktop.secrets")
makedepends=("cargo")
arch=("x86_64" "aarch64")
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("b2c439cbf339711c8be7f283f44b2019a4c34724a4c8a8c7fc62630bbdd756e145b6d0bd38086695e875d0d834e70cbac3d6d164b2ffb8b55109c8ead220f507")

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
