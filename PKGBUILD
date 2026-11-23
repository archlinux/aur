# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The Circagraph server for Arch Linux (#331), published to the AUR by releases
# (scripts/aur-packages.mjs renders this template). It builds cg-convert and pgmp from the
# release's platform archive, and lays the server out as the Debian package does, running on
# Arch's Node.js and PostgreSQL. It was openchronology-server until 0.30, and takes its place:
# circagraph-setup moves that installation's configuration and keeps its users and database.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=circagraph-server
pkgver=0.31.0
pkgrel=1
pkgdesc='Exact timelines, shared on your terms: the Circagraph platform server'
arch=('x86_64')
url='https://github.com/circagraph/timeline-app'
license=('GPL-3.0-only')
depends=('nodejs>=24' 'postgresql' 'gmp' 'sqlite' 'util-linux' 'ca-certificates')
makedepends=('cargo' 'cmake' 'pkgconf' 'python')
# The packages named openchronology-server until 0.30 have the same files; the AUR's last
# openchronology-server (0.31 and later) is empty and depends on this one, so it may stay.
provides=("openchronology-server=$pkgver")
conflicts=('openchronology-server<0.31')
replaces=('openchronology-server<0.31')
# The platform's Node.js modules are built already; stripping or debug packages would only
# touch cg-convert and pgmp, which are small.
options=('!strip' '!debug' '!lto')
install=circagraph-server.install
# The exact-rational type for PostgreSQL, pinned as the other packages pin it.
_pgmp=1849585416f2bc3d070bf8cef6a659907687ec7f
source=("circagraph-server-platform-$pkgver.tar.gz::https://github.com/circagraph/timeline-app/releases/download/v0.31.0/circagraph-server-platform.tar.gz"
        "pgmp-$_pgmp.tar.gz::https://codeload.github.com/dvarrazzo/pgmp/tar.gz/$_pgmp"
        'circagraph.service'
        'circagraph-mail.service'
        'circagraph-syslog.service'
        'circagraph-github.service'
        'circagraph-journald.service'
        'circagraph.env'
        'syslog.env'
        'github.env'
        'journald.env'
        'circagraph-migrate'
        'circagraph-reset-admin-password'
        'cg-import-logs'
        'cg-import-github'
        'circagraph-log-files'
        'circagraph-units'
        'circagraph-setup'
        'circagraph-server.sysusers'
        'README.Arch')
noextract=("circagraph-server-platform-$pkgver.tar.gz")
sha256sums=('ad60dbb1c7a5b3610dec0b7dbe67e011e6291f4bb9af1e8d70d3eac635bc258a'
            'cf7d04d364cadde4304e4130fd314525a637037c4f20f1406a3aa27d47a1302f'
            'be2c3f2c7633989652ff85f2f37199be5931f7d910a677708f2d56f7490fcbe9'
            'caac28ef40a87365757709d7c51b6738b90550da14ebd82ff58d59cdf022a577'
            '12f1a1dd7a38111551a025a67dfbd926eaa3f1888bdc6050bb21ec43b3f071d4'
            'f0be583d4e5ac1dd236a1a5f08bdd2c33b6333bac8dcfdffc15ceaf7be81fe1a'
            'a4f6acb342445dde0e9084b1e47691668e1490888c766656588955656cfa7709'
            'e9f5c9217fd75d9a44814d69becd519ff96360f80775bf50c91b7e9a2d18e82b'
            '5b8e145e7eeeead5d7524456173456aeb6eb3070aaec3794d0a2d2131fed5ee1'
            '2e3f23b7fd01001bb5e8a2b52faea18fec1fa7017dd55e607d0c72de265e055d'
            'ac660a911b63dfec18811cf8f918c6022f430bea9095c0b2eba8c35a503f1c27'
            'a502c8e26c85b236ac3fbfc70876fe7cff8cef9b2ffafd3f0317dc11257a3646'
            'deaf70136a80ae219d30095f05b5bc99f4fc43ab8bb12f471ab515d375a045b4'
            'b6fe0f0a886c9824847b6012eaae82f39735aae0cdbd18d622c77d8ad4d5e81f'
            'b4e908534d4fd9cdaaf414a4fa8f180136c96a5256143180c6ed74196f1e38a8'
            '60689c29bd0f8f834f48e27b0dd7f35e6729ef207089ac83d0ad17744f483fa5'
            'f3b421049edc532e74699bfe550522946434bfd0e761534ed4e77ada39d9ab7a'
            '95a195dfd8facf5c3c7123b4f0c4af73627bee5e91de0ba89489c6557b2ab7c7'
            '1628fa44dcbd1558fd6b6f890e8c937b9ddf180641b5c62cd41c98ace75434e8'
            '4f0d7e844c7a0a050abc01ed3b0b8e859912af9a64c3a6d50d86fedbf0c2a5a0')

prepare() {
  # The archive has no top folder: into its own.
  mkdir -p platform
  bsdtar -xf "circagraph-server-platform-$pkgver.tar.gz" -C platform
}

build() {
  # The SQLite converter, from the crates vendored in the platform archive.
  cd "$srcdir/platform/native"
  cargo build --manifest-path native-store/Cargo.toml --release --locked --offline \
    --bin cg-convert
  # pgmp, for this system's PostgreSQL.
  cd "$srcdir/pgmp-$_pgmp"
  python tools/unmix.py < sql/pgmp.pysql > sql/pgmp--1.1.sql
  python tools/sql2extension.py --extname pgmp sql/pgmp--1.1.sql > sql/pgmp--unpackaged--1.1.sql
  make with_llvm=no
}

package() {
  local app="$pkgdir/usr/lib/circagraph" doc="$pkgdir/usr/share/doc/circagraph-server"
  # The platform (Next.js and the editor), laid out as the other packages lay it out, with
  # this system's Node.js where theirs bundle it.
  install -d "$app"
  cp -a "$srcdir/platform/lib/circagraph/." "$app/"
  install -Dm755 "$srcdir/platform/native/native-store/target/release/cg-convert" \
    "$app/bin/cg-convert"
  # och-convert is the converter's name before the rename, which a configuration may name.
  ln -s cg-convert "$app/bin/och-convert"
  install -d "$app/node/bin"
  ln -s /usr/bin/node "$app/node/bin/node"

  make -C "$srcdir/pgmp-$_pgmp" with_llvm=no DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/pgmp-$_pgmp/COPYING" "$doc/pgmp/COPYING"

  # The Debian package's services (each also under its name before the rename, Alias=),
  # configuration templates and commands.
  local unit
  for unit in circagraph circagraph-mail circagraph-syslog circagraph-github \
      circagraph-journald; do
    sed 's|README.Debian|README.Arch|' "$srcdir/$unit.service" > "$srcdir/$unit.arch.service"
    install -Dm644 "$srcdir/$unit.arch.service" "$pkgdir/usr/lib/systemd/system/$unit.service"
  done
  install -Dm644 "$srcdir/circagraph.env" "$pkgdir/usr/share/circagraph/circagraph.env.example"
  install -Dm644 "$srcdir/syslog.env" "$pkgdir/usr/share/circagraph/syslog.env.example"
  install -Dm644 "$srcdir/github.env" "$pkgdir/usr/share/circagraph/github.env.example"
  install -Dm644 "$srcdir/journald.env" "$pkgdir/usr/share/circagraph/journald.env.example"
  install -Dm755 "$srcdir/circagraph-setup" "$pkgdir/usr/bin/circagraph-setup"
  install -Dm755 "$srcdir/circagraph-migrate" "$pkgdir/usr/bin/circagraph-migrate"
  install -Dm755 "$srcdir/circagraph-reset-admin-password" \
    "$pkgdir/usr/bin/circagraph-reset-admin-password"
  install -Dm755 "$srcdir/cg-import-logs" "$pkgdir/usr/bin/cg-import-logs"
  install -Dm755 "$srcdir/cg-import-github" "$pkgdir/usr/bin/cg-import-github"
  install -Dm755 "$srcdir/circagraph-log-files" "$app/bin/circagraph-log-files"
  install -Dm755 "$srcdir/circagraph-units" "$app/bin/circagraph-units"
  # The commands' names before the rename.
  ln -s circagraph-setup "$pkgdir/usr/bin/openchronology-setup"
  ln -s circagraph-migrate "$pkgdir/usr/bin/openchronology-migrate"
  ln -s circagraph-reset-admin-password "$pkgdir/usr/bin/openchronology-reset-admin-password"
  ln -s cg-import-logs "$pkgdir/usr/bin/och-import-logs"
  ln -s cg-import-github "$pkgdir/usr/bin/och-import-github"
  install -Dm644 "$srcdir/circagraph-server.sysusers" "$pkgdir/usr/lib/sysusers.d/circagraph-server.conf"

  # The documentation, the project's README over docs/README.md.
  install -d "$doc"
  cp -a "$srcdir/platform/doc/." "$doc/"
  install -Dm644 "$srcdir/README.Arch" "$doc/README.Arch"
  install -Dm644 "$srcdir/platform/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
