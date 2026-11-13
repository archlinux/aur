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
pkgver=7.0.0
pkgrel=1
pkgdesc="Copenhagen Hnefatafl client, engine, server and artificial intelligence"
url="https://hnefatafl.org"
license=("AGPL-3.0-or-later")
arch=("x86_64")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib" "openssl")
makedepends=("clang" "llvm" "mold" "rustup" "wget")
source=(
    "https://codeberg.org/dcampbell/hnefatafl/archive/v$pkgver.tar.gz"
    "https://codeberg.org/dcampbell/hnefatafl/media/branch/main/copenhagen-T10-15x192-step673949.onnx"
    "https://codeberg.org/dcampbell/hnefatafl/media/branch/main/tablut9x9.onnx"
)
sha256sums=(
    "f2a3516d065c9db738c81e4ef9822a53c3daa49f668d77b0b8b2134a29b335c6"
    "dea0f6f802825b4b5269822b4f985504bf22e2dcf3fa51663522c2f50945d4b0"
    "c64f58e62454b38c609c7b5cba8f7a7673b6ab42ca6401b5a530a3eb862e6f22"
)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "hnefatafl"

    sed -i 's/cargo-/arch-/' src/lib.rs;
    sed -i 's/games/bin/' packages/hnefatafl-ai-attacker.service
    sed -i 's/games/bin/' packages/hnefatafl-ai-defender.service
    sed -i 's/games/bin/' packages/hnefatafl.service

    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "hnefatafl"

    cargo build --frozen --release

    ./target/release/taflzero --man --username ""
    ./target/release/hnefatafl-client --man
    ./target/release/hnefatafl-server --man
    ./target/release/hnefatafl-text-protocol --man
}

package() {
    cd "hnefatafl"

    install -Dm755 "target/release/taflzero" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-client" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-server" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-text-protocol" -t "$pkgdir/usr/bin"
    install -Dm644 "packages/hnefatafl.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-attacker.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-defender.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "website/src/images/helmet.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.hnefatafl.hnefatafl_client.svg"
    install -Dm644 "taflzero.1" "$pkgdir/usr/share/man/man1/hnefatafl-ai.1"
    install -Dm644 "hnefatafl-client.1" "$pkgdir/usr/share/man/man1/hnefatafl-client.1"
    install -Dm644 "hnefatafl-server.1" "$pkgdir/usr/share/man/man1/hnefatafl-server.1"
    install -Dm644 "hnefatafl-text-protocol.1" "$pkgdir/usr/share/man/man1/hnefatafl-text-protocol.1"
    install -Dm644 "packages/hnefatafl-client.desktop" "$pkgdir/usr/share/applications/hnefatafl-client.desktop"
    install -Dm644 "copenhagen-T10-15x192-step673949.onnx" -t "$pkgdir/usr/share/taflzero"
    install -Dm644 "tablut9x9.onnx" -t "$pkgdir/usr/share/taflzero"
}
