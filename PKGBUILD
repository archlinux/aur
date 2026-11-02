# Maintainer: nabbisen
#
# Filled from this repository by `packaging/aur/render.sh` -- never edited in the AUR clone, and
# no number in it is written by hand (RFC 051 decision 3). `@`-delimited so a half-filled template
# is obvious, the shape `scripts/install.sh` uses.
#
# **Built from the crates.io crate, not a GitHub tag tarball** (RFC 051 F2): a published crate is
# immutable and its sha256 is in the crates.io index, while GitHub's generated archives have
# changed their bytes before. The crate carries its own `Cargo.lock`, so `--locked`/`--frozen`
# reproduce the dependency set the release was published with.
pkgname=stikk
pkgver=0.20.0
pkgrel=1
pkgdesc='A terminal UI for the prikk version control system'
arch=('x86_64' 'aarch64')
url='https://github.com/prikk-vcs/stikk'
license=('Apache-2.0')
# **`prikk>=0.<floor>`, not a bare `prikk`** (RFC 051 F3): stikk is useless without prikk, and the
# AUR resolves prikk's own package -- but an unversioned dependency would be satisfied by the
# `0.0.0` placeholder and leave the user with no prikk. No upper bound: a newer prikk runs, and
# stikk says its output has not been checked rather than refusing (`NFR-R03`).
#
# **`libgcc`, not `gcc-libs`** -- namcap's own reading of Arch's current split on the built
# package: `gcc-libs` is reported as *may not be needed* while `libgcc` is *detected and
# implicitly satisfied*.
depends=('prikk>=0.28' 'glibc' 'libgcc')
makedepends=('cargo')
# **`!debug` as well as `!lto`.** Arch's own `makepkg.conf` enables `debug`, which splits a
# `stikk-debug` package off this one -- and the crate's release profile carries no debug info to
# put in it, so what comes out is an empty `usr/src/debug/stikk` and a `.build-id` symlink
# pointing at a file that is not there (namcap `E:`, measured in `archlinux:base-devel` and
# reproduced locally by turning `debug` on). stikk publishes no debug package, `stikk-bin` has
# said `!debug` from the start, and `strip` still applies either way -- so `/usr/bin/stikk` is
# byte-for-byte what it was, with nothing broken built beside it.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
# From the crates.io index's own `cksum` for this version, and the downloaded crate is checked
# against it before this file is written.
sha256sums=('e92e9912bd6141a4c5cbf69447e8329f3e3086f9553ed74e35aa236ec57d6953')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/stikk "$pkgdir/usr/bin/stikk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
