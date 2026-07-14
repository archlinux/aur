# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: sylflo <veiland@sylvain-chateau.com>
#
# Arch PKGBUILD for veiland. Builds the real set (veiland-core + the
# reference plugins) from source into /usr/bin and installs the veiland
# PAM service so password authentication works on install.
#
# The stress test plugin is not built or packaged.

pkgname=veiland
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland screen locker with process-isolated GPU plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/sylflo/veiland"
license=('GPL-3.0-or-later')

# Runtime shared libraries. Mirrors the flake's buildInputs:
#   pam         -> pam-sys2
#   mesa/glvnd  -> khronos-egl (static EGL), gbm-sys  (libGL/libEGL/libgbm)
#   libdrm      -> drm-sys
#   wayland     -> wayland-sys
#   libxkbcommon-> xkbcommon
# The actual GPU driver .so is the user's system's job (like on Nix).
depends=('pam' 'libglvnd' 'mesa' 'libdrm' 'wayland' 'libxkbcommon')

# Build-only tools: the Rust toolchain. pkgconf lets the -sys crates'
# build scripts find the libraries above.
makedepends=('rust' 'cargo' 'pkgconf')

# /etc/pam.d/veiland is config: never clobber a user's edited copy on
# upgrade (Arch analog of a Debian conffile / rpm %config(noreplace)).
backup=('etc/pam.d/veiland')

# Built from the GitHub release tarball (this is what the AUR copy of
# this file needs). CI still builds the checked-out tree: packages.yml
# stages it under the tarball's directory name and pre-creates a
# placeholder tarball, then runs makepkg --noextract --skipinteg.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acbcd1d9b09b0fc4bd771088f8a80fc054053d2b3dcdc13ac77e43e7fc14d980')

# The real set, as -p flags shared by build() and check().
_crates=(
  veiland-core
  veiland-wallpaper
  veiland-clock
  veiland-particles
  veiland-vignette
  veiland-label
  veiland-sakura
  veiland-snow
  veiland-rain
  veiland-embers
  veiland-fireflies
  veiland-gradient
  veiland-parallax
  veiland-blobs
  veiland-raymarcher
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  local args=()
  for c in "${_crates[@]}"; do args+=(-p "$c"); done
  # --locked pins dependency versions to the committed Cargo.lock
  # (reproducible), while still allowing the normal network fetch a
  # by-hand `cargo build` does. Not --frozen (offline): the general
  # packaging guidelines don't call for a network-isolated build, and
  # offline needs a separate vendoring step we don't want yet.
  cargo build --release --locked "${args[@]}"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target

  # The shipped set plus the library crates compiled into it: `cargo
  # test -p` only runs the named packages' tests, so the libraries need
  # their own -p flags here or their suites never run. Test-only —
  # they produce no packaged artifact (package() still loops _crates).
  local args=()
  for c in "${_crates[@]}" veiland-protocol veiland-plugin veiland-text; do
    args+=(-p "$c")
  done
  # spawn_true_exits_zero needs /bin/true; present on Arch, so no skip
  # (unlike the Nix sandbox).
  cargo test --release --locked "${args[@]}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Binaries -> /usr/bin. install -D creates parent dirs; 755 = executable.
  # The veiland-core crate builds a binary named `veiland` (its [[bin]]);
  # the reference plugins keep their crate names.
  install -Dm755 "target/release/veiland" "$pkgdir/usr/bin/veiland"
  for c in "${_crates[@]}"; do
    [ "$c" = veiland-core ] && continue
    install -Dm755 "target/release/$c" "$pkgdir/usr/bin/$c"
  done

  # PAM service (Arch uses the system-auth variant).
  install -Dm644 "packaging/pam/veiland.system-auth" \
    "$pkgdir/etc/pam.d/veiland"

  # Example config the user copies into ~/.config/veiland/.
  install -Dm644 "packaging/veiland.example.toml" \
    "$pkgdir/usr/share/veiland/config.example.toml"

  # Wallpaper referenced by the example config (Unsplash License: free
  # commercial use and redistribution, no attribution required).
  install -Dm644 "docs/examples/assets/sakura-dusk.jpg" \
    "$pkgdir/usr/share/veiland/sakura-dusk.jpg"

  # Ready-made example scenes. The hotplug repro config is a dev tool,
  # not a scene. Asset paths in the examples are repo-relative (so they
  # run in place from a checkout); point the installed copies at the
  # installed wallpaper.
  install -dm755 "$pkgdir/usr/share/veiland/examples"
  install -m644 docs/examples/*.toml "$pkgdir/usr/share/veiland/examples/"
  rm "$pkgdir/usr/share/veiland/examples/hotplug-repro.toml"
  sed -i 's|docs/examples/assets/|/usr/share/veiland/|' \
    "$pkgdir/usr/share/veiland/examples/"*.toml

  # License text.
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
