# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The OpenChronology server for Arch Linux (#331), published to the AUR by releases
# (scripts/aur-packages.mjs renders this template). It builds och-convert and pgmp from the
# release's platform archive, and lays the server out as the Debian package does, running on
# Arch's Node.js and PostgreSQL.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=openchronology-server
pkgver=0.22.0
pkgrel=1
pkgdesc='Exact timelines, shared on your terms: the OpenChronology platform server'
arch=('x86_64')
url='https://github.com/openchronology/timeline-app'
license=('GPL-3.0-only')
depends=('nodejs>=24' 'postgresql' 'gmp' 'sqlite' 'util-linux' 'ca-certificates')
makedepends=('cargo' 'cmake' 'pkgconf' 'python')
# The platform's Node.js modules are built already; stripping or debug packages would only
# touch och-convert and pgmp, which are small.
options=('!strip' '!debug' '!lto')
install=openchronology-server.install
# The exact-rational type for PostgreSQL, pinned as the other packages pin it.
_pgmp=1849585416f2bc3d070bf8cef6a659907687ec7f
source=("openchronology-server-platform-$pkgver.tar.gz::https://github.com/openchronology/timeline-app/releases/download/v0.22.0/openchronology-server-platform.tar.gz"
        "pgmp-$_pgmp.tar.gz::https://codeload.github.com/dvarrazzo/pgmp/tar.gz/$_pgmp"
        'openchronology.service'
        'openchronology-mail.service'
        'openchronology-syslog.service'
        'openchronology-journald.service'
        'openchronology.env'
        'syslog.env'
        'journald.env'
        'openchronology-migrate'
        'openchronology-reset-admin-password'
        'och-import-logs'
        'openchronology-setup'
        'openchronology-server.sysusers'
        'openchronology-server.tmpfiles'
        'README.Arch')
noextract=("openchronology-server-platform-$pkgver.tar.gz")
sha256sums=('b09e6fc3257c08e8e4fa0a6d2cf3fd87a3be89c76bb8611f1a07e97d365d894a'
            'cf7d04d364cadde4304e4130fd314525a637037c4f20f1406a3aa27d47a1302f'
            '7d794e7517f2686e0d714f01a4bba4fcb9abc59b6f68d70882e53f28bf5daea8'
            '9bc5061f00c3049011e2124147b81eb02e50945a5b17f40430cfe91de662796c'
            '0efe9d4fb85fa3eda01e4e0d569dcc6fe690f3841e0cd13996d56d065e32e255'
            'e9757422cf67c2de9024ff749a8933683387e34a1b24d69c1681625e00f4b3f3'
            'efa1e54f1aefd61e321dd20c703108097d8eb55a839e9aea83ca8a6a45dbdec4'
            '283a6135fd3fe8c99e11abce054d44cbfb1bcb0cd08d36dac92bbead9bbf6f6b'
            '624f78e4dae97437a173ea1bb3d62d1f4a9af3c62ce9b31ae55bdab52d05205a'
            '197c993801448b311ba5d951c2c3b5a7c3a6bca2aefc8971ede0998efc68aca4'
            'd98214c2530b3de542750b6974d445574a83c178fe313511aecdde6df94f4514'
            '35cdb1780d80d6ca1f896afc969cb696c575e6986a8f8476320059c70093e73b'
            '452bdb85fcbbd7a2a838dcdf41d0ecb81a428d0458d07359a6d509a60b7cb91a'
            '0f58d2c4d54ba5107df36d82e6b3800744a57f9d2d4347aaea7cd6ce9323a7f6'
            'c0b84b8772412a87a367e7d1350cb82e9f1696eb20c6c9d5131c4a0159683ffe'
            '9a003fc29e2832868e6315f62070aba28f88e759eba1a5246541825dc609ff5d')

prepare() {
  # The archive has no top folder: into its own.
  mkdir -p platform
  bsdtar -xf "openchronology-server-platform-$pkgver.tar.gz" -C platform
}

build() {
  # The SQLite converter, from the crates vendored in the platform archive.
  cd "$srcdir/platform/native"
  cargo build --manifest-path native-store/Cargo.toml --release --locked --offline \
    --bin och-convert
  # pgmp, for this system's PostgreSQL.
  cd "$srcdir/pgmp-$_pgmp"
  python tools/unmix.py < sql/pgmp.pysql > sql/pgmp--1.1.sql
  python tools/sql2extension.py --extname pgmp sql/pgmp--1.1.sql > sql/pgmp--unpackaged--1.1.sql
  make with_llvm=no
}

package() {
  local app="$pkgdir/usr/lib/openchronology" doc="$pkgdir/usr/share/doc/openchronology-server"
  # The platform (Next.js and the editor), laid out as the other packages lay it out, with
  # this system's Node.js where theirs bundle it.
  install -d "$app"
  cp -a "$srcdir/platform/lib/openchronology/." "$app/"
  install -Dm755 "$srcdir/platform/native/native-store/target/release/och-convert" \
    "$app/bin/och-convert"
  install -d "$app/node/bin"
  ln -s /usr/bin/node "$app/node/bin/node"

  make -C "$srcdir/pgmp-$_pgmp" with_llvm=no DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/pgmp-$_pgmp/COPYING" "$doc/pgmp/COPYING"

  # The Debian package's services, configuration templates and commands.
  local unit
  for unit in openchronology openchronology-mail openchronology-syslog openchronology-journald; do
    sed 's|README.Debian|README.Arch|' "$srcdir/$unit.service" > "$srcdir/$unit.arch.service"
    install -Dm644 "$srcdir/$unit.arch.service" "$pkgdir/usr/lib/systemd/system/$unit.service"
  done
  install -Dm644 "$srcdir/openchronology.env" "$pkgdir/usr/share/openchronology/openchronology.env.example"
  install -Dm644 "$srcdir/syslog.env" "$pkgdir/usr/share/openchronology/syslog.env.example"
  install -Dm644 "$srcdir/journald.env" "$pkgdir/usr/share/openchronology/journald.env.example"
  install -Dm755 "$srcdir/openchronology-setup" "$pkgdir/usr/bin/openchronology-setup"
  install -Dm755 "$srcdir/openchronology-migrate" "$pkgdir/usr/bin/openchronology-migrate"
  install -Dm755 "$srcdir/openchronology-reset-admin-password" \
    "$pkgdir/usr/bin/openchronology-reset-admin-password"
  install -Dm755 "$srcdir/och-import-logs" "$pkgdir/usr/bin/och-import-logs"
  install -Dm644 "$srcdir/openchronology-server.sysusers" "$pkgdir/usr/lib/sysusers.d/openchronology-server.conf"
  install -Dm644 "$srcdir/openchronology-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/openchronology-server.conf"

  # The documentation, the project's README over docs/README.md.
  install -d "$doc"
  cp -a "$srcdir/platform/doc/." "$doc/"
  install -Dm644 "$srcdir/README.Arch" "$doc/README.Arch"
  install -Dm644 "$srcdir/platform/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
