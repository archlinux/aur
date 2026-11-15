# Maintainer: Austin Riba <austin@m51.io>
pkgname=gelly
pkgver=2.1.0
pkgrel=1
pkgdesc="Jellyfin and Subsonic music player"
url="https://github.com/Fingel/gelly"
license=("GPL-3.0-or-later")
depends=("libadwaita" "gst-plugins-good" "org.freedesktop.secrets")
makedepends=("cargo" "gettext")
arch=("x86_64" "aarch64")
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("154180d5d4d214d3ff82012d04cc642759581ef93e644825fd1b6306e8df084818310a6681347580c1b7aa1e4479cff7c685f056303c5dadba3c282db7c1cbb7")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    LOCALEDIR=/usr/share/locale cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 target/release/gelly "$pkgdir/usr/bin/gelly"
    install -Dm 0644 resources/io.m51.Gelly.desktop "$pkgdir/usr/share/applications/io.m51.Gelly.desktop"
    install -Dm 0644 resources/io.m51.Gelly.metainfo.xml "$pkgdir/usr/share/metainfo/io.m51.Gelly.metainfo.xml"
    install -Dm 0644 resources/io.m51.Gelly.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/io.m51.Gelly.gschema.xml"
    install -Dm 0644 resources/io.m51.Gelly.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.m51.Gelly.svg"
    install -Dm 0644 resources/io.m51.Gelly-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.m51.Gelly-symbolic.svg"
    for po_file in po/*.po; do
        lang=$(basename "$po_file" .po)
        install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/gelly.mo" "$po_file"
    done
}
