# Maintainer: Thomas J Faughnan Jr <thomas@faughnan.net>

pkgname=imessage-exporter
pkgver=2.6.2
pkgrel=4
pkgdesc='Export iMessage data and run diagnostics'
arch=(x86_64)
url='https://github.com/ReagentX/imessage-exporter'
license=(GPL-3.0-or-later)
depends=(gcc-libs)
makedepends=(cargo)
optdepends=('imagemagick: image conversion support'
            'ffmpeg: audio and video conversion support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2fbc272ce06d0eecf0c6982de1a3709d0226b7c63fdd581923eb3fe5714db9b8e8ad34478417044439588c598dc5a80e72b001912882afc4f3c553a1b206c952')

prepare() {
    cd "$pkgname-$pkgver"
    # XXX: upstream should update these for each release
    sed -i "s|version = \"0\.0\.0\"|version = \"$pkgver\"|" \
        imessage-database/Cargo.toml
    sed -i "s|version = \"0\.0\.0\"|version = \"$pkgver\"|" \
        imessage-exporter/Cargo.toml
    export RUSTUP_TOOLCHAIN=stable
    cargo update --offline imessage-database imessage-exporter
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
