# Maintainer: Thomas J Faughnan Jr <thomas@faughnan.net>

pkgname=imessage-exporter
pkgver=3.2.1
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
sha512sums=('3f7eb3adf5486f62c4ecd79eb3391b9ad4abfaf526c1ca58910cd817c95c5f8f58124f6d71a30d0194c6be8d2fee7927df95a58c2ec87beeee9755cd1d15e60d')

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
