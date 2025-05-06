# Maintainer: David Campbell <dcampbell24@gmail.com>

pkgname=hnefatafl-copenhagen
pkgver=1.0.0
pkgrel=1
pkgdesc="Copenhagen Hnefatafl client."
url="https://hnefatafl.org"
license=("MIT OR Apache-2.0")
arch=("x86_64")
provides=("hnefatafl-copenhagen")
conflicts=("hnefatafl-copenhagen")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib")
makedepends=("base-devel" "clang" "llvm" "mold" "pandoc" "rustup")
source=("https://github.com/dcampbell24/hnefatafl-copenhagen/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=("8b3edf628188a7a0ba736708560bdca954aa8a6adacacec44828cf96a0062460")

build() {
    tar -xvzf v1.0.0.tar.gz
    cd "$pkgname-$pkgver"
    cargo build --release --bin hnefatafl-client --no-default-features --features client,sound,timer,www

    pandoc\
        --variable=title:hnefatafl-client\
        --variable=section:1\
        --variable=date:2025-02-22\
        --standalone --to=man packages/hnefatafl-client.1.dj --output=packages/hnefatafl-client.1

    gzip --no-name --best packages/hnefatafl-client.1
    pandoc --standalone --to=plain README.md --output=packages/README.txt
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hnefatafl-client" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "icons/king_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_22x22.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_42x42.png" "$pkgdir/usr/share/icons/hicolor/42x42/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "packages/README.txt" "$pkgdir/usr/share/doc/hnefatafl-copenhagen/README.txt"
    install -Dm644 "packages/hnefatafl-client.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-client.1.gz"
    install -Dm644 "packages/hnefatafl-client.desktop" "$pkgdir/usr/share/applications/hnefatafl-client.desktop"
}

check() {
        cd "$pkgname-$pkgver"
        .githooks/pre-commit
}
