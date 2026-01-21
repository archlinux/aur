# Maintainer: Thomas J Faughnan Jr <thomas@faughnan.net>

pkgname=imessage-exporter
pkgver=3.3.1
pkgrel=1
pkgdesc='Export iMessage data and run diagnostics'
arch=(x86_64)
url='https://github.com/ReagentX/imessage-exporter'
license=(GPL-3.0-or-later)
depends=(gcc-libs)
makedepends=(cargo)
optdepends=('imagemagick: image conversion support'
            'ffmpeg: audio and video conversion support')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dec866858987ee55393955ca77c533b404f84b8326baae8ec8a28f9d4de32a791e57658f325971a488f8d84133d0faaf44bd90192502356630380b2189ad8ea8')

prepare() {
    cd "$pkgname-$pkgver"
    # XXX: upstream should update these for each release
    sed -i "s|version = \"0\.0\.0\"|version = \"$pkgver\"|" \
        imessage-database/Cargo.toml
    sed -i "s|version = \"0\.0\.0\"|version = \"$pkgver\"|" \
        imessage-exporter/Cargo.toml
    export RUSTUP_TOOLCHAIN=stable
    cargo update imessage-database imessage-exporter
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # https://github.com/ReagentX/imessage-exporter/issues/613
    export TZ=America/Los_Angeles
    # https://github.com/ReagentX/imessage-exporter/issues/640
    # cargo test --workspace --frozen --all-features
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
