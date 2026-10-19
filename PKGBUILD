# Maintainer: lostmason <lostmason@tutamail.com>

pkgname=neomacs-git
_pkgname=neomacs
pkgver=0.0.19.r25162.g7cc75cc8
pkgrel=1
pkgdesc='NEO Emacs: Emacs rewritten in Rust with a GPU display engine (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/eval-exec/neomacs'
license=('GPL-3.0-or-later')
# The Linux product (Cargo.toml, neomacs-production-capabilities.linux) links
# GStreamer for video.  dbus, lcms2, Wayland, X11 and Vulkan/GL are found at
# run time; the ones the GUI cannot start without are hard dependencies.
depends=(
  'dbus'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'libdrm'
  'libxkbcommon'
  'ncurses'
  'vulkan-icd-loader'
  'wayland'
  'zlib'
)
makedepends=('cargo' 'git')
optdepends=(
  'lcms2: color management (color-distance and friends)'
  'libx11: X11 frontend'
  'libxcursor: X11 cursor themes'
  'libxi: X11 input'
  'libxrandr: X11 multi-monitor support'
  'gst-plugins-good: video playback codecs'
  'gst-plugins-bad: video playback codecs'
  'gst-plugins-ugly: video playback codecs'
  'gst-libav: video playback codecs'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# makepkg's LTO flags leak into the C/C++ built by cc-rs (jemalloc, simdutf);
# the release profile already enables Rust LTO.
options=('!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Anchor on the workspace version rather than `git describe`: the last
  # release tag lags it, and the archlib path is named after it.
  local version
  version="$(sed -n '/^\[workspace\.package\]/,/^\[/{s/^version *= *"\(.*\)"/\1/p}' Cargo.toml)"
  printf '%s.r%s.g%s' "$version" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

_target_triple() {
  echo "$CARCH-unknown-linux-gnu"
}

prepare() {
  cd "$_pkgname"
  # Under rustup, rust-toolchain.toml selects the pinned toolchain.
  cargo fetch --locked --target "$(_target_triple)"
}

build() {
  cd "$_pkgname"
  export CARGO_TARGET_DIR="$srcdir/$_pkgname/target"
  export CARGO_NET_OFFLINE=true
  # A RUSTFLAGS environment variable replaces the rustflags in
  # .cargo/config.toml, so the function alignment it sets is repeated here.
  if [[ $CARCH == x86_64 ]]; then
    export RUSTFLAGS="${RUSTFLAGS:-} -Cllvm-args=-align-all-functions=6"
  fi
  # Compiles Rust, bootstraps Elisp and generates the portable dump.
  cargo xtask fresh-build --release
}

package() {
  cd "$_pkgname"
  source scripts/lib/archlib.sh

  local release_dir="$srcdir/$_pkgname/target/release"
  local archlib_rel
  archlib_rel="$(neomacs_archlib_relpath Cargo.toml "$(_target_triple)")"

  # Same layout as scripts/package-rpm.sh, with /usr as the prefix.
  install -Dm755 "$release_dir/neomacs" "$pkgdir/usr/bin/neomacs"
  install -Dm755 "$release_dir/neomacsclient" "$pkgdir/usr/bin/neomacsclient"

  install -d "$pkgdir/usr/$archlib_rel"
  local helper
  for helper in neomacs-temacs bootstrap-neomacs; do
    if [[ -f $release_dir/$helper ]]; then
      install -m755 "$release_dir/$helper" "$pkgdir/usr/$archlib_rel/"
    fi
  done
  install -m644 "$release_dir/neomacs.pdump" "$pkgdir/usr/$archlib_rel/"

  install -d "$pkgdir/usr/share/neomacs"
  cp -a lisp etc leim "$pkgdir/usr/share/neomacs/"
  if [[ -d info ]]; then
    cp -a info "$pkgdir/usr/share/neomacs/"
  fi

  scripts/install-linux-desktop-assets.sh "$pkgdir/usr"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  neomacs_verify_archlib \
    "$pkgdir/usr/bin/neomacs" \
    "$pkgdir/usr/$archlib_rel/neomacs.pdump" \
    "$pkgdir/usr/$archlib_rel" \
    "$pkgdir/usr/share/neomacs"
}
