# Maintainer: David Campbell <dcampbell24@gmail.com>

# Zero-Clause BSD
# ===============

# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.

# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
# FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
# DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
# AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

pkgname=hnefatafl-copenhagen
pkgver=2.1.0
pkgrel=1
pkgdesc="Copenhagen Hnefatafl client."
url="https://hnefatafl.org"
license=("MIT OR Apache-2.0")
arch=("x86_64")
provides=("hnefatafl-copenhagen")
conflicts=("hnefatafl-copenhagen")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib")
makedepends=("base-devel" "clang" "llvm" "mold" "pandoc" "rustup")
source=("https://github.com/dcampbell24/hnefatafl/archive/refs/tags/v2.1.0.tar.gz")
sha256sums=("a6b69c7f08264a64f0cfd7fb88f3935cbbb3d41d85c8a8ad6055061148b6337b")

build() {
    tar -xvzf v2.1.0.tar.gz
    cd "hnefatafl-$pkgver"
    cargo build --release --example hnefatafl-client --no-default-features

    pandoc\
        --variable=title:hnefatafl-client\
        --variable=section:1\
        --variable=date:2025-02-22\
        --standalone --to=man packages/hnefatafl-client.1.dj --output=packages/hnefatafl-client.1

    gzip --no-name --best packages/hnefatafl-client.1
    pandoc --standalone --to=plain README.md --output=packages/README.txt
}

package() {
    cd "hnefatafl-$pkgver"
    install -Dm755 "target/release/examples/hnefatafl-client" -t "$pkgdir/usr/bin"
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
    cd "hnefatafl-$pkgver"
    .githooks/pre-commit
}
