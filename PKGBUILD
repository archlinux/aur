# Maintainer: Joseph R. Quinn <quinn.josephr@proton.me>

pkgname=kiosk-rs-git
_pkgname=kiosk-rs
pkgver=r6.gec1af1d
pkgrel=1
pkgdesc="Minimal Wayland kiosk compositor: run one application fullscreen on one output (git)"
arch=('x86_64')
url="https://github.com/quinnjr/kiosk-rs"
license=('MIT')

# Direct linkage, from readelf -d on the built binary:
#   libgbm.so.1 -> mesa            libseat.so.1      -> seatd
#   libudev.so.1 -> systemd-libs   libinput.so.10    -> libinput
#   libxkbcommon.so.0 -> libxkbcommon
#
# libglvnd is *not* in that list and is still required: smithay dlopens libEGL
# rather than linking it, so the binary carries a "Failed to load LibEGL" path
# instead of a DT_NEEDED entry. namcap will report libglvnd as possibly unneeded
# for exactly that reason; without it the compositor cannot initialise a
# renderer and exits at startup.
#
# There is deliberately no libwayland dependency: smithay's wayland-backend uses
# its own Rust protocol implementation here, so nothing links libwayland-server.
depends=(
  'mesa'
  'seatd'
  'systemd-libs'
  'libinput'
  'libxkbcommon'
  'libglvnd'
)
# The manifest declares rust-version = 1.94, so a stale toolchain fails at
# compile time rather than silently producing a different binary.
makedepends=('cargo' 'git')
# Only the package this replaces. Not the bare binary name `kiosk`: that is a
# generic word an unrelated package could legitimately use, and pacman detects a
# real /usr/bin/kiosk file conflict without being told to.
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
# Tracks the repository's default branch, which is `develop` rather than main.
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Upstream has no tags yet, so the commit-count form is what actually gets
  # used. The tag branch is kept for when it does: dropping it later would mean
  # a package version that goes backwards.
  local tag
  if tag=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "${tag#v}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

# Rust embeds the absolute path of every file it compiles into panic metadata, so
# without remapping the binary ships hundreds of paths from whatever machine
# built it. Two prefixes need it:
#
#   $srcdir      smithay's build script generates its EGL/GL bindings into
#                OUT_DIR, and makepkg reports those as "Package contains
#                reference to $srcdir".
#   $CARGO_HOME  every dependency crate's file!() location. makepkg does not
#                warn about these, so they leak silently -- ~550 of them here.
#
# Set identically in build() and check() on purpose: a different RUSTFLAGS
# between them invalidates the cache and recompiles the whole tree twice.
_rustflags() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  local cargo_home="${CARGO_HOME:-$HOME/.cargo}"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/$pkgname --remap-path-prefix=$cargo_home=/usr/src/cargo"

  # And std's own panic locations, when building with rustup rather than the
  # `rust` package. Derived from the sysroot so it does not depend on where
  # RUSTUP_HOME points. The /usr guard is load-bearing: with the `rust` package
  # the sysroot *is* /usr, and remapping that would rewrite unrelated paths --
  # that toolchain already ships std remapped to /rustc/<hash>, so there is
  # nothing to do.
  local sysroot
  sysroot=$(rustc --print sysroot)
  if [[ $sysroot != /usr ]]; then
    RUSTFLAGS+=" --remap-path-prefix=$sysroot=/usr/src/rust"
  fi
}

build() {
  cd "$_pkgname"
  _rustflags
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  _rustflags
  # Safe in a build chroot: the tests that need a GPU detect an unreachable
  # /dev/dri and return early. Upstream's KIOSK_REQUIRE_DRM=1 turns that skip
  # into a failure and is deliberately *not* set here, since a builder has no
  # GPU and the manual test matrix is what covers those paths.
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  # The binary is `kiosk`; the crate is `kiosk-rs`.
  install -Dm755 target/release/kiosk "$pkgdir/usr/bin/kiosk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # The hardware test procedure doubles as the operator's list of known
  # limitations, which is the part a packager's users actually need.
  install -Dm644 docs/manual-test-matrix.md \
    "$pkgdir/usr/share/doc/$pkgname/manual-test-matrix.md"
}
