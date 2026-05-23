# Maintainer:
# SPDX-FileCopyrightText: 2025 David Campbell <david@hnefatafl.or>
# SPDX-License-Identifier: 0BSD

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
pkgver=5.12.0
pkgrel=1
real_pkgrel=1
pkgdesc="Copenhagen Hnefatafl client, engine, server and artificial intelligence"
url="https://hnefatafl.org"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("hnefatafl-copenhagen")
conflicts=("hnefatafl-copenhagen")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib" "openssl")
makedepends=("base-devel" "clang" "llvm" "mold" "rustup" "wget")
source=("https://codeberg.org/dcampbell/hnefatafl/archive/v$pkgver-$real_pkgrel.tar.gz")
sha256sums=("b19b59e01092824dd4dd158c8469a664f4738f40feb50aa8e023913644cfa0e9")
build() {
    tar -xvzf v$pkgver-$real_pkgrel.tar.gz
    cd "hnefatafl"

    sed -i 's/cargo-/arch-/' src/bin/hnefatafl-client/main.rs;

    sed -i 's/opt/usr\/share/' examples/taflzero.rs;

    cargo build --release --examples
    cargo build --release

    ./target/release/examples/taflzero --man --username ""
    ./target/release/hnefatafl-client --man
    ./target/release/hnefatafl-server --man
    ./target/release/hnefatafl-server-full --man
    ./target/release/hnefatafl-text-protocol --man

    gzip --no-name --best taflzero.1
    gzip --no-name --best hnefatafl-server.1
    gzip --no-name --best hnefatafl-server-full.1
    gzip --no-name --best hnefatafl-text-protocol.1
    gzip --no-name --best hnefatafl-client.1

    sed -i 's/games/bin/' packages/hnefatafl-ai-attacker.service
    sed -i 's/games/bin/' packages/hnefatafl-ai-defender.service
    sed -i 's/games/bin/' packages/hnefatafl.service

    wget https://codeberg.org/dcampbell/hnefatafl/media/branch/main/default_nn.onnx

    sed -i 's/opt/usr\/share/' packages/hnefatafl-ai-attacker.service;
    sed -i 's/opt/usr\/share/' packages/hnefatafl-ai-defender.service;
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
