# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The OpenChronology server for Arch Linux (#331), published to the AUR by releases
# (scripts/aur-packages.mjs renders this template). It builds och-convert and pgmp from the
# release's platform archive, and lays the server out as the Debian package does, running on
# Arch's Node.js and PostgreSQL.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=openchronology-server
pkgver=0.24.0
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
source=("openchronology-server-platform-$pkgver.tar.gz::https://github.com/openchronology/timeline-app/releases/download/v0.24.0/openchronology-server-platform.tar.gz"
        "pgmp-$_pgmp.tar.gz::https://codeload.github.com/dvarrazzo/pgmp/tar.gz/$_pgmp"
        'openchronology.service'
        'openchronology-mail.service'
        'openchronology-syslog.service'
        'openchronology-github.service'
        'openchronology-journald.service'
        'openchronology.env'
        'syslog.env'
        'github.env'
        'journald.env'
        'openchronology-migrate'
        'openchronology-reset-admin-password'
        'och-import-logs'
        'och-import-github'
        'openchronology-log-files'
        'openchronology-setup'
        'openchronology-server.sysusers'
        'openchronology-server.tmpfiles'
        'README.Arch')
noextract=("openchronology-server-platform-$pkgver.tar.gz")
sha256sums=('9707969a97738c056055d96c98fc49b6011000c7083f7225e56b3a961d180110'
            'cf7d04d364cadde4304e4130fd314525a637037c4f20f1406a3aa27d47a1302f'
            'bbdbd4512b6b067a0386db30e9063481f458efb8be1e5393e4902770e985258f'
            '276dd4ed7abb74585d05c43c790fe8aa27aaca5261d5ee9ce4cb74d1f80d8b14'
            '4babf7120ded1d7c6bfe50dc6f073e1b4ee0e3fef81d8d0352b525b4a8589462'
            '6b1d882fdc1a9f3af097a2a158cf5953ff4a45bd9163b766fb5072bd65c44c21'
            'c6f8bdc03ba86c93380b7f839f60abded956d9f6ab96cb420fbf494d8ff1d4f0'
            '857aa840ea8d15fef8d047d56e84d41a53765fa30e9c2cb9932978b665100601'
            '4f82142be7fd1b5277a8f227334f6095cfebf82a64eb60d9a19227b065c73d90'
            'e3055f1697068df1465f0697df4a4c7e7fc88c3735ee12be3fb165a049e10aac'
            '95cfdee08ff5c1dc7a85d52c76e8f3b3c5461cb29fe450f23a8f44865e659757'
            '1ba54b6c618fc212cf58d9edc1f8d36e1c6932bfe0792ba7377e66d280efce48'
            'd98214c2530b3de542750b6974d445574a83c178fe313511aecdde6df94f4514'
            '35cdb1780d80d6ca1f896afc969cb696c575e6986a8f8476320059c70093e73b'
            '374d47215d0215ab060e366496610cc2324b05320418244760bb77c20f5a3fff'
            '3e121c1f5b4e3cd35eccf1d6ac7c84bc1291e311041d6401bb17c6072689057d'
            'e7b637aa64dee6f60b2431205307a8ef3b8e4e9674f24a12dbed08d8493c2a8f'
            '7d80b2df15ba90c8fd6a08d0e4d2dad2edb30f2b7cbde59f0463861bab201baa'
            'cadf04f84c702c178a565e3d088791a0987b03206ba005632075abfe5a48664f'
            'd415c8d5662a3c7959b4dcf56ad29b4c375d28d3bfef440cc0dade04cd6d2557')

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
  for unit in openchronology openchronology-mail openchronology-syslog openchronology-github \
      openchronology-journald; do
    sed 's|README.Debian|README.Arch|' "$srcdir/$unit.service" > "$srcdir/$unit.arch.service"
    install -Dm644 "$srcdir/$unit.arch.service" "$pkgdir/usr/lib/systemd/system/$unit.service"
  done
  install -Dm644 "$srcdir/openchronology.env" "$pkgdir/usr/share/openchronology/openchronology.env.example"
  install -Dm644 "$srcdir/syslog.env" "$pkgdir/usr/share/openchronology/syslog.env.example"
  install -Dm644 "$srcdir/github.env" "$pkgdir/usr/share/openchronology/github.env.example"
  install -Dm644 "$srcdir/journald.env" "$pkgdir/usr/share/openchronology/journald.env.example"
  install -Dm755 "$srcdir/openchronology-setup" "$pkgdir/usr/bin/openchronology-setup"
  install -Dm755 "$srcdir/openchronology-migrate" "$pkgdir/usr/bin/openchronology-migrate"
  install -Dm755 "$srcdir/openchronology-reset-admin-password" \
    "$pkgdir/usr/bin/openchronology-reset-admin-password"
  install -Dm755 "$srcdir/och-import-logs" "$pkgdir/usr/bin/och-import-logs"
  install -Dm755 "$srcdir/och-import-github" "$pkgdir/usr/bin/och-import-github"
  install -Dm755 "$srcdir/openchronology-log-files" "$app/bin/openchronology-log-files"
  install -Dm644 "$srcdir/openchronology-server.sysusers" "$pkgdir/usr/lib/sysusers.d/openchronology-server.conf"
  install -Dm644 "$srcdir/openchronology-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/openchronology-server.conf"

  # The documentation, the project's README over docs/README.md.
  install -d "$doc"
  cp -a "$srcdir/platform/doc/." "$doc/"
  install -Dm644 "$srcdir/README.Arch" "$doc/README.Arch"
  install -Dm644 "$srcdir/platform/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
