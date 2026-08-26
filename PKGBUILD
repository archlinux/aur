# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: sylflo <veiland@sylvain-chateau.com>
#
# Arch PKGBUILD for veiland. Builds the real set (veiland-core + the
# reference plugins) from source into /usr/bin and installs the veiland
# PAM service so password authentication works on install.
#
# The stress test plugin is not built or packaged.

pkgname=veiland
pkgver=0.3.0
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
#
# The trailing group is the Python widget tier (the veiland-* status/info
# widgets installed below): the interpreter, the gi bindings + drawing libs
# (pycairo, Pillow), the D-Bus client, and the C libraries whose typelibs the
# widgets load through gi (librsvg, pango; gdk-pixbuf is pulled transitively by
# librsvg's typelib but listed for clarity). A .py has no ELF for makepkg to
# scan, so these are declared explicitly. On Arch the typelibs land in
# /usr/lib/girepository-1.0 and resolve with no wrapper (unlike Nix).
depends=('pam' 'libglvnd' 'mesa' 'libdrm' 'wayland' 'libxkbcommon'
         'python' 'python-gobject' 'python-cairo' 'python-pillow'
         'python-jeepney' 'librsvg' 'pango' 'gdk-pixbuf2')

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
# sha256 of the v$pkgver GitHub release tarball. Regenerate on each bump:
#   curl -sL "$url/archive/refs/tags/v$pkgver.tar.gz" | sha256sum
sha256sums=('757d1d0d02b39c983a070d785b58c011d19fcc36ddbdba278a99afc0c3da8774')

# The real set, as -p flags shared by build() and check().
_crates=(
  veiland-core
  veiland-wallpaper
  veiland-particles
  veiland-vignette
  veiland-sakura
  veiland-snow
  veiland-rain
  veiland-embers
  veiland-fireflies
  veiland-gradient
  veiland-parallax
  veiland-blobs
  veiland-raymarcher
  veiland-shader
)

# The nine production Python widgets, as "installed-name=source-basename"
# pairs (mirrors the flake's pythonWidgets). Installed as veiland-<name>
# commands so a scene references them by bare name exactly like a compiled
# plugin. NOT the two battery teaching demos (battery.py, battery_cairo.py).
_widgets=(
  veiland-now-playing=now_playing.py
  veiland-weather=weather.py
  veiland-wifi=wifi.py
  veiland-ethernet=ethernet.py
  veiland-bluetooth=bluetooth.py
  veiland-avatar=avatar.py
  veiland-markup=markup.py
  veiland-shape=shape.py
  veiland-battery=battery_svg.py
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

  # Python widgets. Stash the SDK + companions + widget scripts + icons under
  # /usr/lib/veiland/python, PRESERVING the python/examples/ layout so each
  # widget's own sys.path shim (dirname(dirname(__file__))) and ICON_DIR
  # (<dir>/icons) resolve unmodified -- no .py edit. Each veiland-<name> in
  # /usr/bin is a tiny exec shim into the stashed script: a shim, NOT a symlink
  # (a symlink resolves __file__ back to /usr/bin and breaks the shims), and no
  # env wrapper (Arch's gi loader finds /usr/lib/girepository-1.0 by default).
  local pylib="$pkgdir/usr/lib/veiland/python"
  install -Dm644 -t "$pylib" python/veiland_plugin.py python/veiland_svg.py \
    python/veiland_text.py python/veiland_layout.py python/veiland_dbus.py
  install -dm755 "$pylib/examples"
  cp -r python/examples/icons "$pylib/examples/icons"
  chmod -R u=rwX,go=rX "$pylib/examples/icons"
  for w in "${_widgets[@]}"; do
    local name="${w%%=*}" src="${w##*=}"
    install -Dm755 "python/examples/$src" "$pylib/examples/$name"
    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /usr/lib/veiland/python/examples/%s "$@"\n' "$name" \
      > "$pkgdir/usr/bin/$name"
    chmod 755 "$pkgdir/usr/bin/$name"
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

  # Ready-made example scenes. The hotplug repro config is a dev tool, and the
  # two battery demo scenes reference widgets that are NOT installed as commands
  # (battery.py / battery_cairo.py) -- drop all three. The scenes already
  # reference every plugin by its bare veiland-<name> (Rust and Python alike),
  # so only the asset paths need rewriting: repo-relative in the source (so they
  # run from a checkout), pointed at the installed wallpaper here.
  install -dm755 "$pkgdir/usr/share/veiland/examples"
  install -m644 docs/examples/*.toml "$pkgdir/usr/share/veiland/examples/"
  rm "$pkgdir/usr/share/veiland/examples/hotplug-repro.toml" \
     "$pkgdir/usr/share/veiland/examples/battery_python.toml" \
     "$pkgdir/usr/share/veiland/examples/battery_cairo.toml"
  sed -i 's|docs/examples/assets/|/usr/share/veiland/|' \
    "$pkgdir/usr/share/veiland/examples/"*.toml

  # License text.
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
