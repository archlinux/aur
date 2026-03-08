# Maintainer: Austin Riba <austin@m51.io>
pkgname=gelly
pkgver=0.19.0
pkgrel=1
pkgdesc="A Jellyfin media server client focused on music."
url="https://github.com/Fingel/gelly"
license=("GPL-3.0-or-later")
depends=("libadwaita")
makedepends=("cargo")
arch=("x86_64" "aarch64")
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("a3259dc5ade897680b886c0ca13235d526dafd4989c4904fa53dba03e2318e179c8b8f8ff0bad95cb1c4a865cf9ccedda7d1079af86fbd7c4a362a84e3e8e3e0")

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
