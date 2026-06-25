# Maintainer: Austin Riba <austin@m51.io>
pkgname=gelly
pkgver=1.8.0
pkgrel=1
pkgdesc="Music player for Jellyfin and Subsonic"
url="https://github.com/Fingel/gelly"
license=("GPL-3.0-or-later")
depends=("libadwaita" "gst-plugins-good" "org.freedesktop.secrets")
makedepends=("cargo" "gettext")
arch=("x86_64" "aarch64")
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("f2cf10a0e879abc3d57b33403d29fd8666cb32968ce52ad4246d10a84059fb52f7316ef0c468eb09081bfa3977247205631d14044c9fac2f90c6f215a9a10577")

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
