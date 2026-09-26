# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>

# aw-server-rust has no tags or releases at all - it is consumed as a submodule
# of the activitywatch bundle, pinned by sha. ActivityWatch 0.13.2 ships
# 656f3c9 (2024-10-05); this tracks master, which carries two things that
# release does not: --profile named instances (c8533a0) and an /api/0/import
# that merges into an existing bucket instead of returning 500 (0a94e0f).
#
# activitywatch-bin also contains these binaries, but only under /opt and its
# PKGBUILD fails to symlink them (its loop tests the live path at build time),
# so there is no file conflict today. Declared anyway rather than relying on
# that bug staying unfixed.
pkgname=aw-server-rust-git
pkgver=r897.5bd198f
pkgrel=1
pkgdesc="ActivityWatch server, built from master"
arch=('x86_64')
url="https://github.com/ActivityWatch/aw-server-rust"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'rust' 'npm')
# makepkg.conf enables lto globally. rusqlite's bundled sqlite3.c is compiled
# through the cc crate with those CFLAGS while the Rust side links its own way,
# and the C symbols go missing - the build dies on undefined sqlite3_column_*.
# Verified by toggling it: with lto the link fails, without it the same build
# succeeds. An earlier theory blaming cargo feature resolution was wrong.
options=('!lto')
provides=('aw-server-rust')
conflicts=('aw-server-rust')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/aw-server-rust"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/aw-server-rust"
  # Fetched here rather than declared as sources: aw-webui has its own nested
  # submodule, and wiring two levels by hand buys nothing for a local package.
  git submodule update --init --recursive aw-webui
}

build() {
  cd "$srcdir/aw-server-rust"

  # The webui is compiled into the server, so it has to exist first.
  make -C ./aw-webui build

  # Exactly what `make build` runs, minus aw-sync - see below for why that is
  # left out. Nothing else about the Makefile is a problem; the sqlite link
  # failure this package used to hit is entirely the lto option above.
  cargo build --release --bin aw-server

  # aw-sync is deliberately not built. It pulls in aw-client-rust, whose
  # src/config.rs uses `toml` while Cargo.toml declares it only under
  # [dev-dependencies] - so the lib builds under `cargo test` and nowhere else.
  # Broken on master as of r897. Add it back once that is fixed upstream.
}

package() {
  cd "$srcdir/aw-server-rust"
  install -Dm755 target/release/aw-server "$pkgdir/usr/bin/aw-server"
  # the bundle calls this binary aw-server-rust; keep that name working too
  ln -s aw-server "$pkgdir/usr/bin/aw-server-rust"
  install -Dm644 aw-server.service "$pkgdir/usr/lib/systemd/user/aw-server.service"
}
