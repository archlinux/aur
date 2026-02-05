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
pkgver=5.0.1
pkgrel=1
real_pkgrel=1
pkgdesc="Copenhagen Hnefatafl client. Discord: https://discord.gg/h56CAHEBXd"
url="https://hnefatafl.org"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("hnefatafl-copenhagen")
conflicts=("hnefatafl-copenhagen")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib" "openssl")
makedepends=("base-devel" "clang" "llvm" "mold" "rustup")
source=("https://github.com/dcampbell24/hnefatafl/archive/refs/tags/v$pkgver-$real_pkgrel.tar.gz")
sha256sums=("28b7adf5964bd261898541925a62fcbb384786845145a5a0c46735ad20c40e11")

build() {
    tar -xvzf v$pkgver-$real_pkgrel.tar.gz
    cd "hnefatafl-$pkgver-$real_pkgrel"

    cargo build --release

    ./target/release/hnefatafl-ai --man --username ""
    ./target/release/hnefatafl-client --man
    ./target/release/hnefatafl-server --man
    ./target/release/hnefatafl-server-full --man
    ./target/release/hnefatafl-text-protocol --man

    gzip --no-name --best hnefatafl-ai.1
    gzip --no-name --best hnefatafl-server.1
    gzip --no-name --best hnefatafl-server-full.1
    gzip --no-name --best hnefatafl-text-protocol.1
    gzip --no-name --best hnefatafl-client.1

    sed -i 's/games/bin/' packages/hnefatafl-ai-attacker.service
    sed -i 's/games/bin/' packages/hnefatafl-ai-defender.service
    sed -i 's/games/bin/' packages/hnefatafl.service
}

package() {
    cd "hnefatafl-$pkgver-$real_pkgrel"
    install -Dm755 "target/release/hnefatafl-ai" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-client" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-server" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-server-full" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-text-protocol" -t "$pkgdir/usr/bin"
    install -Dm644 "packages/hnefatafl.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-attacker.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-defender.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "assets/helmet.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.hnefatafl.hnefatafl_client.svg"
    install -Dm644 "hnefatafl-ai.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-ai.1.gz"
    install -Dm644 "hnefatafl-client.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-client.1.gz"
    install -Dm644 "hnefatafl-server.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-server.1.gz"
    install -Dm644 "hnefatafl-server-full.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-server-full.1.gz"
    install -Dm644 "hnefatafl-text-protocol.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-text-protocol.1.gz"
    install -Dm644 "packages/hnefatafl-client.desktop" "$pkgdir/usr/share/applications/hnefatafl-client.desktop"
}
