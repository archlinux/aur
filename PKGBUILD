# Maintainer: Thomas J Faughnan Jr <thomas@faughnan.net>

pkgname=imessage-exporter
pkgver=3.1.0
pkgrel=1
pkgdesc='Export iMessage data and run diagnostics'
arch=(x86_64)
url='https://github.com/ReagentX/imessage-exporter'
license=(GPL-3.0-or-later)
depends=(gcc-libs)
makedepends=(cargo)
optdepends=('imagemagick: image conversion support'
            'ffmpeg: audio and video conversion support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('928b1637642514a41ddc2c3c689d1952e88419e779cebb8ffa11c74f26c3135842aa3aa9760f06ea3773651a17c4a77e99a53dd1c40fd9d743078ca1f05940dc')

prepare() {
    cd "$pkgname-$pkgver"
    # XXX: upstream should update these for each release
    sed -i "s|version = \"0\.0\.0\"|version = \"$pkgver\"|" \
        imessage-database/Cargo.toml
    sed -i "s|version = \"0\.0\.0\"|version = \"$pkgver\"|" \
        imessage-exporter/Cargo.toml
    export RUSTUP_TOOLCHAIN=stable
    cargo update imessage-database imessage-exporter
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -Dm644 imessage-exporter/README.md \
        "$pkgdir/usr/share/doc/$pkgname/imessage-exporter.md"
    install -Dm644 imessage-database/README.md \
        "$pkgdir/usr/share/doc/$pkgname/imessage-database.md"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
        docs/features.md \
        docs/faq.md \
        docs/diagnostics.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/tables" docs/tables/*.md
}
