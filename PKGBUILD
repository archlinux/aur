# Maintainer: Yangtse Su <yangtsesu@gmail.com>
pkgname=pixlay
pkgver=0.2.0
pkgrel=1
pkgdesc="Native Linux photo collage maker designed for GNOME"
# `aarch64` is the claim that this tree builds under Arch Linux ARM too, and that half of the
# package is built there: no GitHub runner has an aarch64 Arch userland. The release's arm64
# binaries are the runner's (`AGENTS.md`, "Distribution").
arch=('x86_64' 'aarch64')
url="https://github.com/YangtseSu/pixlay"
license=('GPL-3.0-or-later')
# `gtk4`, `libadwaita` and `glycin` are the shell and the decoder the meson `dependency()`
# calls name with a version floor. Every other entry is a library one of the two binaries
# names in its own `DT_NEEDED` (`readelf -d`, measured 2026-09-28 — `glib2` is the
# `libglib-2.0.so.0` / `libgobject-2.0.so.0` / `libgio-2.0.so.0` trio, `cairo` is the
# canvas, `fontconfig` and `libseccomp` are what the text stack and glycin's sandbox link),
# plus `hicolor-icon-theme`, which owns the theme the two icons are installed into. gtk4
# pulls all of them in today, which is exactly why `namcap` calls them *implicitly satisfied*
# rather than missing; a `depends` names what the package links, not what its neighbour
# happens to carry (`extra/loupe`, the same stack, lists every one of them beside a few more).
# `libheif` is the one entry neither binary links: glycin runs its loaders as child processes,
# so it is `glycin-heif` that links it — and glycin itself carries it as an optional
# dependency, which this package cannot, because since 0.2.0 AVIF is the export's default
# format and an AVIF or HEIC photo needs that same loader: without libheif the default path
# fails, so it is a `depends` here and not an `optdepends`.
depends=(
  cairo
  fontconfig
  glib2
  glibc
  glycin
  gtk4
  hicolor-icon-theme
  libadwaita
  libgcc
  libheif
  libseccomp
)
# `gettext` is not here because it is a member of `base-devel`, which `makepkg` assumes and a
# clean chroot has by definition. `cargo` is a name `rust` provides (and conflicts with, and
# replaces) and is kept beside it so the entry stays right if the two split again.
makedepends=('cargo' 'rust' 'meson')
# `updpkgsums` fills the checksum from the pushed `v$pkgver` tag, so it carries `SKIP` until that
# tag exists — and a tag that was re-pointed needs the cached `$pkgname-$pkgver.tar.gz` deleted
# first, because `updpkgsums` reads the file already in `SRCDEST` and would print the old tag's
# sum (measured 2026-09-27). `.SRCINFO`, the AUR's own file, comes from `makepkg --printsrcinfo`.
source=("$pkgname-$pkgver.tar.gz::https://github.com/YangtseSu/pixlay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97a3e83b589aa6bf5c658e0dec72a52ecd94a95342f5ed7a6f38441b7d976ab3')

# The vendored registry, and the `cargo vendor` that fills it: a download, and so `prepare()`'s
# work and not `build()`'s — `makepkg -e` re-runs `build()` on a tree whose vendor directory is
# already there, and a clean chroot runs it with the network closed. With an empty `CARGO_HOME`
# and no network, `cargo vendor` fails against `index.crates.io` (measured 2026-09-28).
prepare() {
  cd "$pkgname-$pkgver"

  # `cargo vendor` writes the source-replacement config to stdout and the crates themselves into
  # `vendor/`. The config has to sit at the source root because cargo looks for it by walking up
  # from the working directory of the cargo it starts, which is under the build directory.
  install -d .cargo
  cargo vendor --locked vendor > .cargo/config.toml
}

# No `RUSTFLAGS` of this file's own. `debug = 1` (Cargo.toml) writes the build path into every
# binary, and makepkg's `buildenv/rust.sh` is what remaps it —
# `--remap-path-prefix=$srcdir=/usr/src/debug/$pkgbase`, which is also the directory makepkg's
# debug-source collection reads. A second remap here wins over makepkg's (measured 2026-09-28: the
# binaries named the later flag's target and not `/usr/src/debug/...`) and leaves the split
# `pixlay-debug` package with an empty `usr/src/debug/pixlay/` — a clean chroot's namcap says so,
# "Directory (usr/src/debug/pixlay) is empty", and the package loses its source tree.
build() {
  cd "$pkgname-$pkgver"

  # Vendored, so the build never reaches the network, and `CARGO_NET_OFFLINE` says so to
  # the cargo call meson makes.
  export CARGO_NET_OFFLINE=true

  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"

  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
