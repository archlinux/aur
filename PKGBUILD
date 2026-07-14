# Maintainer:
# SPDX-FileCopyrightText: 2025 David Campbell <david@hnefatafl.org>
# SPDX-License-Identifier: 0BSD
#
# Zero-Clause BSD
# ===============
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
# FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
# DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
# AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

pkgname=hnefatafl-copenhagen
pkgver=6.2.0
pkgrel=3
real_pkgrel=1
pkgdesc="Copenhagen Hnefatafl client, engine, server and artificial intelligence"
url="https://hnefatafl.org"
license=("AGPL-3.0-or-later")
arch=("x86_64")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib" "openssl")
makedepends=("clang" "llvm" "mold" "rustup" "wget")
source=("https://codeberg.org/dcampbell/hnefatafl/archive/v$pkgver-$real_pkgrel.tar.gz" "https://codeberg.org/dcampbell/hnefatafl/media/branch/main/default_nn.onnx")
sha256sums=("f336f668ab3851378eef21caeb447d03453ed92d67f1e70aa392defa50dd73a1" "e7015c7e682f63a4ce7fca971f46543a88233e8f8d3525e3a62e2534d0cfc762")

prepare() {
    cd "hnefatafl"

    sed -i 's/cargo-/arch-/' src/lib.rs;

    sed -i 's/games/bin/' packages/hnefatafl-ai-attacker.service
    sed -i 's/games/bin/' packages/hnefatafl-ai-defender.service
    sed -i 's/games/bin/' packages/hnefatafl.service
}

build() {
    cd "hnefatafl"

    cargo build --release --examples
    cargo build --release

    ./target/release/examples/taflzero --man --username ""
    ./target/release/hnefatafl-client --man
    ./target/release/hnefatafl-server --man
    ./target/release/hnefatafl-server-full --man
    ./target/release/hnefatafl-text-protocol --man
}

package() {
    cd "hnefatafl"

    install -Dm755 "target/release/examples/taflzero" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-client" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-server" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-server-full" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-text-protocol" -t "$pkgdir/usr/bin"
    install -Dm644 "packages/hnefatafl.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-attacker.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-defender.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "website/src/images/helmet.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.hnefatafl.hnefatafl_client.svg"
    install -Dm644 "taflzero.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-ai.1.gz"
    install -Dm644 "hnefatafl-client.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-client.1.gz"
    install -Dm644 "hnefatafl-server.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-server.1.gz"
    install -Dm644 "hnefatafl-server-full.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-server-full.1.gz"
    install -Dm644 "hnefatafl-text-protocol.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-text-protocol.1.gz"
    install -Dm644 "packages/hnefatafl-client.desktop" "$pkgdir/usr/share/applications/hnefatafl-client.desktop"
    install -Dm644 "default_nn.onnx" -t "$pkgdir/usr/share/taflzero"
}
